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
package delivery

import (
	"log"
	"motel-backend/middleware"
	repository "motel-backend/repository"
	"motel-backend/token"
	"net/http"

	"github.com/labstack/echo/v4"
)

type billDelivery struct {
	serviceRepo repository.BillServiceRepo
}

func NewBillDelivery(tokenMaker token.Maker, echo *echo.Echo, serviceRepo repository.BillServiceRepo) {

	bill := &billDelivery{serviceRepo: serviceRepo}
	//echo.Group("/").Use(middleware.AuthMiddleware)

	echo.GET("/bill", middleware.AuthMiddleware(tokenMaker, bill.apiBill))
}

func (bill *billDelivery) apiBill(echo echo.Context) error {

	var results, error = bill.serviceRepo.GetBill()
	if error != nil {
		return echo.JSON(http.StatusInternalServerError, "Can'n get Bill")
	}
	log.Print("\n\nhhhhhhhhhhhhhhhhhh\n\n", results)

	return echo.JSON(http.StatusOK, results)
}
