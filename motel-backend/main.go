package main

import (
	"motel-backend/config"
	accdeli "motel-backend/delivery/account"
	infrast "motel-backend/infrast/postgress"
	accserv "motel-backend/service/account"

	roomdeli "motel-backend/delivery/room"

	roomserv "motel-backend/service/room"

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

	// Call api Login
	accoutInfrast := infrast.NewTableAccount(gorm)
	accountService := accserv.NewAccountService(accoutInfrast)
	accdeli.NewAccountDelivery(echoContext, accountService)

	// Call api Rooms
	roomInfrast := infrast.NewTableRoom(gorm)
	roomService := roomserv.NewRoomService(roomInfrast)
	roomdeli.NewRoomDelivery(echoContext, roomService)

	echoContext.Logger.Fatal(echoContext.Start(":8080"))
}
