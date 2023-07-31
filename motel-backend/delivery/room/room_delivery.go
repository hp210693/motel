package delivery

import (
	"fmt"
	repository "motel-backend/repository/room"
	"net/http"

	"github.com/labstack/echo/v4"
)

type roomDelivery struct {
	serviceRepo repository.RoomServiceRepo
}

func NewRoomDelivery(echo *echo.Echo, serviceRepo repository.RoomServiceRepo) {
	room := &roomDelivery{serviceRepo: serviceRepo}

	echo.GET("/room", room.apiAllRoom)
}

func (room *roomDelivery) apiAllRoom(echo echo.Context) error {

	var rooms, error = room.serviceRepo.FetchAllRoom()

	fmt.Print("\n\nhhhhhhhhhhhhhhhhhh\n\n", rooms)

	if error != nil {
		return echo.JSON(http.StatusOK, "error")
	}

	return echo.JSON(http.StatusOK, rooms)
}
