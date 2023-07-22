package handlers

import (
	"fmt"
	"motel-backend/config"
	"motel-backend/models"
	"net/http"

	"github.com/labstack/echo/v4"
)

func GetAllAccount(c echo.Context) error {
	var accounts []models.Accounts
	db := config.DB()

	if result := db.Find(&accounts); result.Error != nil {
		fmt.Println("something error = ", result.Error)
		return result.Error
	}
	fmt.Println("server reciver = ", accounts)
	return c.JSON(http.StatusOK, accounts)
}

func GetLogin(c echo.Context) error {
	var accounts models.Accounts
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
}
