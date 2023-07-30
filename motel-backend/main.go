package main

import (
	"motel-backend/config"
	delivery "motel-backend/delivery/account"
	infrast "motel-backend/infrast/postgress"
	service "motel-backend/service/account"

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

	echoContext := echo.New()

	accoutInfrast := infrast.NewTableAccount(gorm)
	accountService := service.NewAccountService(accoutInfrast)
	delivery.NewAccountDelivery(echoContext, accountService)

	/* e.GET("/account", handlers.GetAllAccount)
	e.GET("/login", handlers.GetLogin)
	e.GET("/room", handlers.GetAllRoom) */
	echoContext.Logger.Fatal(echoContext.Start(":8080"))
}
