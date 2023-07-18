package main

import (
	"motel-backend/config"
	"motel-backend/handlers"
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {

	// Connect To Database
	config.DatabaseInit()
	gorm := config.DB()

	db, err := gorm.DB()

	if err != nil {
		panic(err)
	}

	db.Ping()

	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.JSON(http.StatusOK, map[string]interface{}{
			"hello": "world",
		})
	})
	e.GET("/account", handlers.GetAllAccount)
	e.GET("/login", handlers.GetLogin)
	e.Logger.Fatal(e.Start(":8080"))
}
