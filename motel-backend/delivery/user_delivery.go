/*
MIT License

Copyright (c) 2023 Hung Phan (@hp210693)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
package delivery

import (
	"log"
	"motel-backend/model"
	repository "motel-backend/repository"
	"motel-backend/token"
	utli "motel-backend/utli"
	"net/http"
	"time"

	"github.com/labstack/echo/v4"
)

var LAYER = "DELIVERY"

type SignInRequest struct {
	UserID   string `json:"user_name"`
	Password string `json:"password"`
}

type SignInResponse struct {
	Message     string    `json:"message"`
	AccessToken string    `json:"access_token"`
	UserID      string    `json:"user_id"`
	Role        string    `json:"role"`
	UserName    string    `json:"user_name"`
	IssuedAt    time.Time `json:"issued_at"`
	Expired     time.Time `json:"expired"`
}

type userDelivery struct {
	serviceRepo repository.UserServiceRepo
	config      *utli.Config
}

func NewUserDelivery(echo *echo.Echo, config *utli.Config, serviceRepo repository.UserServiceRepo) {
	user := &userDelivery{config: config, serviceRepo: serviceRepo}

	echo.GET("/signin", user.apiLoginUser)
	echo.POST("/signup", user.apiSignUpUser)

}

func (acc *userDelivery) apiLoginUser(ctx echo.Context) error {
	var request SignInRequest
	var response = SignInResponse{
		UserID: "", UserName: "", IssuedAt: time.Now(),
		Expired: time.Now(), AccessToken: "", Message: "",
	}

	if err := ctx.Bind(&request); err != nil {
		var str = "Server can't binding the json formatting from user"
		log.Print("[" + LAYER + "] " + str)
		response.Message = str
		return ctx.JSON(http.StatusBadRequest, response)
	}

	var user, err = acc.serviceRepo.SignInUser(request.UserID, request.Password)
	if err != nil {
		log.Print("[" + LAYER + "]" + err.Error())
		response.Message = "This account is Invalid"
		return ctx.JSON(http.StatusInternalServerError, response)
	}

	maker, err := token.NewPasetoMaker(acc.config.SymmetricKey)
	if err != nil {
		log.Print("[" + LAYER + "]" + err.Error())
		response.Message = "Creating access token is error"
		return ctx.JSON(http.StatusNonAuthoritativeInfo, response)
	}

	timeDuration := acc.config.AccessTokenDuration
	token, payload, err := maker.CreateToken(
		user.UserName, checkRoles(user.RoleId),
		time.Duration(timeDuration),
	)
	if err != nil {
		log.Print("[" + LAYER + "]" + err.Error())
		response.Message = "Creating access token is error"
		return ctx.JSON(http.StatusNonAuthoritativeInfo, response)
	}

	response = SignInResponse{
		UserID: payload.UserID, UserName: payload.UserID, IssuedAt: payload.IssuedAt,
		Expired: payload.Expired, AccessToken: token, Role: payload.Role, Message: "Succeed",
	}
	return ctx.JSON(http.StatusOK, response)
}

func checkRoles(roleID int) string {
	switch roleID {
	case 1, 2, 3:
		return "admin"
	case 4:
		return "client"
	case 5:
		return "user"
	default:
		return ""
	}
}

func (acc *userDelivery) apiSignUpUser(echo echo.Context) error {

	var account = model.User{}
	start := time.Now()
	if err := echo.Bind(&account); err != nil {
		return echo.JSON(http.StatusInternalServerError, "Can't sign up error")
	}
	log.Printf("\nclient sent to server\n %v \n", account)

	if error := acc.serviceRepo.SignUpUser(account.UserId, account.RoleId, account.RoleId,
		account.UserName, account.CID, account.DriverLicense, account.Phone,
		account.Password, account.Email, &start, &start); error != nil {
		log.Printf("\n\n\n\n\n++++++++++++++++++++++??????????? = \n\n\n\n\n%v", error.Error())
		return echo.JSON(http.StatusInternalServerError, error.Error())
	}

	return echo.JSON(http.StatusOK, "Success")
}
