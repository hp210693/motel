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
package infrast

import (
	"fmt"
	model "motel-backend/model"
	repository "motel-backend/repository"

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

	fmt.Printf("\n\n\ninfrast tableRoom called database room ok \n\n\n%v", rooms)

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
