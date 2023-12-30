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
	"motel-backend/config"
	"motel-backend/delivery"
	infrast "motel-backend/infrast/postgress"
	"motel-backend/service"
	"motel-backend/token"
	util "motel-backend/utli"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

var symmetricKey = []byte("YELLOW SUBMARINE, BLACK WIZARDRY") // Must be 32 bytes

// Server serves HTTP requests for our banking service.
type Server struct {
	config util.Config
	//store      db.Store
	store      *gorm.DB
	tokenMaker token.Maker
	router     *echo.Echo
}

// NewServer creates a new HTTP server and set up routing.
func NewServer(echo *echo.Echo, store *gorm.DB) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(string(symmetricKey))
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		//config:     config,
		store:      store,
		tokenMaker: tokenMaker,
		router:     echo,
	}

	server.setupRouter()
	return server, nil
}

func (server *Server) setupRouter() {

	// Call api user login
	userInfrast := infrast.NewTableUser(server.store)
	userService := service.NewUserService(userInfrast)
	delivery.NewUserDelivery(server.router, userService)

	// Call api Room
	roomInfrast := infrast.NewTableRoom(server.store)
	roomService := service.NewRoomService(roomInfrast)
	delivery.NewRoomDelivery(server.router, roomService)

	// Call api Bill
	billInfrast := infrast.NewTableBill(server.store)
	billService := service.NewBillService(billInfrast)
	delivery.NewBillDelivery(server.tokenMaker, server.router, billService)

	server.router.Logger.Fatal(server.router.Start(":8080"))

	//authRoutes := router.Group("/").Use(authMiddleware(server.tokenMaker))
	//authRoutes.POST("/accounts", server.createAccount)

}

func main() {

	// Connect To Database
	config.DatabaseInit()
	gorm := config.DB()

	db, err := gorm.DB()

	if err != nil {
		panic(err)
	}

	db.Ping()
	echo := echo.New()

	_, _ = NewServer(echo, gorm)

	//tokenMaker, err := token.NewPasetoMaker(string(symmetricKey))
	//authMiddleware := middleware.AuthMiddleware(tokenMaker)

	//log.Println(server)

	/* // Call api user login
	userInfrast := infrast.NewTableUser(gorm)
	userService := service.NewUserService(userInfrast)
	delivery.NewUserDelivery(echo, userService)

	// Call api Room
	roomInfrast := infrast.NewTableRoom(gorm)
	roomService := service.NewRoomService(roomInfrast)
	delivery.NewRoomDelivery(echo, roomService)

	// Call api Bill
	billInfrast := infrast.NewTableBill(gorm)
	billService := service.NewBillService(billInfrast)
	delivery.NewBillDelivery(echo, billService)

	echo.Logger.Fatal(echo.Start(":8080")) */
}
