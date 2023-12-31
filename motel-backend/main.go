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
	"fmt"
	"motel-backend/delivery"
	infrast "motel-backend/infrast/postgress"
	"motel-backend/service"
	"motel-backend/store"
	"motel-backend/token"
	utli "motel-backend/utli"

	"github.com/labstack/echo/v4"
)

func main() {

	//Load configuation env file
	config, err := utli.LoadConfig()
	if err != nil {
		return
	}

	//Load database
	store := store.NewDB(&config)
	db, err := store.Store.DB()
	if err != nil {
		return
	}
	db.Ping()

	//Create server
	echo := echo.New()
	setupRouter(echo, store, &config)
}

func setupRouter(echo *echo.Echo, store *store.DB, config *utli.Config) {
	tokenMaker, err := token.NewPasetoMaker(string(config.SymmetricKey))
	if err != nil {
		panic(fmt.Errorf("cannot create token maker: %w", err))
	}

	// Call api user login
	userInfrast := infrast.NewTableUser(store.Store)
	userService := service.NewUserService(userInfrast)
	delivery.NewUserDelivery(echo, config, userService)

	// Call api Room
	roomInfrast := infrast.NewTableRoom(store.Store)
	roomService := service.NewRoomService(roomInfrast)
	delivery.NewRoomDelivery(echo, roomService)

	// Call api Bill
	billInfrast := infrast.NewTableBill(store.Store)
	billService := service.NewBillService(billInfrast)
	delivery.NewBillDelivery(tokenMaker, echo, billService)
	echo.Logger.Fatal(echo.Start(":8080"))
}
