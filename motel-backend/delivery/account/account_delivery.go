package delivery

import (
	"fmt"
	repository "motel-backend/repository/account"
	"net/http"

	"github.com/labstack/echo/v4"
)

type accountDelivery struct {
	serviceRepo repository.AccountServiceRepo
}

func NewAccountDelivery(echo *echo.Echo, serviceRepo repository.AccountServiceRepo) {

	account := &accountDelivery{serviceRepo: serviceRepo}

	echo.GET("/login", account.apiLogin)
}

func (acc *accountDelivery) apiLogin(echo echo.Context) error {

	user_name := echo.QueryParam("user")
	password := echo.QueryParam("pass")

	fmt.Printf("2 server reciver user = %v , pass = %v \n", user_name, password)
	var result = acc.serviceRepo.Login(user_name, password)
	fmt.Print("\n\nhhhhhhhhhhhhhhhhhh\n\n", result)
	if result != nil {
		return echo.JSON(http.StatusOK, "error")
	}

	return echo.JSON(http.StatusOK, "ok")
}

/* func GetAllAccount(c echo.Context) error {
	var accounts []model.Account
	db := config.DB()

	if result := db.Find(&accounts); result.Error != nil {
		fmt.Println("something error = ", result.Error)
		return result.Error
	}
	fmt.Println("server reciver = ", accounts)
	return c.JSON(http.StatusOK, accounts)
}

func GetLogin(c echo.Context) error {
	var accounts model.Account
	user_name := c.QueryParam("user")
	password := c.QueryParam("pass")
	db := config.DB()

	fmt.Printf("2 server reciver user = %v , pass = %v \n", user_name, password)
	if result := db.First(&accounts, "User_Name = ? AND Password = ?", user_name, password); result.Error != nil {
		fmt.Println("something error = ", result.Error)
		return result.Error
	}
	fmt.Printf("something respon\n %v", accounts)
	return c.JSON(http.StatusOK, accounts)
} */
