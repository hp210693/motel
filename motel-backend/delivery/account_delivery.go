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
	"fmt"
	"motel-backend/model"
	repository "motel-backend/repository"
	"net/http"
	"time"

	"github.com/labstack/echo/v4"
)

type accountDelivery struct {
	serviceRepo repository.AccountServiceRepo
}

func NewAccountDelivery(echo *echo.Echo, serviceRepo repository.AccountServiceRepo) {

	account := &accountDelivery{serviceRepo: serviceRepo}

	echo.GET("/login", account.apiLogin)
	echo.POST("/login", account.apiSignUpAccount)
}

func (acc *accountDelivery) apiLogin(echo echo.Context) error {

	user_name := echo.QueryParam("user")
	password := echo.QueryParam("pass")

	fmt.Printf("2 server reciver user = %v , pass = %v \n", user_name, password)
	var result = acc.serviceRepo.FetchLogin(user_name, password)
	fmt.Print("\n\nhhhhhhhhhhhhhhhhhh\n\n", result)
	if result != nil {
		return echo.JSON(http.StatusInternalServerError, "Can't Login")
	}

	return echo.JSON(http.StatusOK, "Success")
}

func (acc *accountDelivery) apiSignUpAccount(echo echo.Context) error {

	var account = model.Account{}
	start := time.Now()
	if err := echo.Bind(&account); err != nil {
		return echo.JSON(http.StatusInternalServerError, "Can't sign up error")
	}
	fmt.Printf("\nclient sent to server\n %v \n", account.UserName)

	if error := acc.serviceRepo.SignUpAccount(account.AccountId, account.RoleId, account.RoleId, account.UserName, account.CID, account.DriverLicense,
		account.Phone, account.Password, account.Email, &start, &start); error != nil {
		return error
	}

	return echo.JSON(http.StatusCreated, "Success")
}
