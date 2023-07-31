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
