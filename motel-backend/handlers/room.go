package handlers

import (
	"fmt"
	"motel-backend/config"
	"motel-backend/models"
	"net/http"

	"github.com/labstack/echo/v4"
)

func GetAllRoom(c echo.Context) error {
	var rooms []models.Room
	db := config.DB()

	fmt.Printf("call api get all room \n")
	if result := db.Find(&rooms); result.Error != nil {
		fmt.Println(result.Error)
		return result.Error
	}

	fmt.Printf("something respon\n %v", rooms)
	return c.JSON(http.StatusOK, rooms)
}

/* func GetLogin(c echo.Context) error {
	var accounts models.Account
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
