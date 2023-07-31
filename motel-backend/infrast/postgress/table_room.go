package infrast

import (
	"fmt"
	model "motel-backend/model/room"
	repository "motel-backend/repository/room"

	"gorm.io/gorm"
)

type tableRoom struct {
	db *gorm.DB
}

func NewTableRoom(db *gorm.DB) repository.RoomInfrastRepo {
	return &tableRoom{db: db}
}

// DeleteRoom implements repository.RoomInfrastRepo.
func (tbRoom *tableRoom) DeleteRoom(room model.Room) error {
	panic("unimplemented")
}

// GetAllRoom implements repository.RoomInfrastRepo.
func (tbRoom *tableRoom) GetAllRoom() ([]model.Room, error) {
	var rooms []model.Room

	// Get all records
	// SELECT * FROM room;
	if result := tbRoom.db.Find(&rooms); result.Error != nil {
		return []model.Room{}, result.Error
	}

	fmt.Printf("called database room ok \n%v", rooms)

	return rooms, nil
}

// InsertRoom implements repository.RoomInfrastRepo.
func (tbRoom *tableRoom) InsertRoom(room model.Room) error {
	panic("unimplemented")
}

// UpdateRoom implements repository.RoomInfrastRepo.
func (tbRoom *tableRoom) UpdateRoom(room model.Room) error {
	panic("unimplemented")
}
