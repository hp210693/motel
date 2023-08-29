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
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World! hhhhhhhhhhhhhhhh")
	})
	e.Logger.Fatal(e.Start(":8080"))

	/* // Connect To Database
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
	accountService := service.NewAccountService(accoutInfrast)
	delivery.NewAccountDelivery(echoContext, accountService)

	// Call api Room
	roomInfrast := infrast.NewTableRoom(gorm)
	roomService := service.NewRoomService(roomInfrast)
	delivery.NewRoomDelivery(echoContext, roomService)

	// Call api Bill
	billInfrast := infrast.NewTableBill(gorm)
	billService := service.NewBillService(billInfrast)
	delivery.NewBillDelivery(echoContext, billService)

	echoContext.Logger.Fatal(echoContext.Start(":8080")) */
}
