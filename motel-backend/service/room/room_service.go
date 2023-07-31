package service

import (
	"fmt"
	model "motel-backend/model/room"
	repository "motel-backend/repository/room"
)

type roomService struct {
	roomRepo repository.RoomInfrastRepo
}

func NewRoomService(repo repository.RoomInfrastRepo) repository.RoomServiceRepo {
	return &roomService{roomRepo: repo}
}

// FetchAllRoom implements repository.RoomServiceRepo.
func (room *roomService) FetchAllRoom() ([]model.Room, error) {

	var rooms, error = room.roomRepo.GetAllRoom()

	if error != nil {
		return rooms, error
	}

	fmt.Printf("\n----\n%v", rooms)

	return rooms, nil
}
