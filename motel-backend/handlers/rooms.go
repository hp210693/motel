package handlers

import (
	"fmt"
	"motel-backend/config"
	"motel-backend/models"
	"net/http"

	"github.com/labstack/echo/v4"
)

func GetAllRoom(c echo.Context) error {
	var accounts []models.Accounts
	db := config.DB()

	if result := db.Find(&accounts); result.Error != nil {
		fmt.Println(result.Error)
		return result.Error
	}
	return c.JSON(http.StatusOK, accounts)
}
