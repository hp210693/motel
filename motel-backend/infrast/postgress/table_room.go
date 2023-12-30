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
	"log"
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

func (tb *tableRoom) DeleteRoom(room model.Room) error {

	// Delete a Room to database;
	if result := tb.db.Delete(&room); result.Error != nil {
		return result.Error
	}

	log.Printf("Delete database Room ok \n%v", room)
	return nil
}

func (tb *tableRoom) GetAllRoom() ([]model.Room, error) {

	var rooms []model.Room

	// SELECT * FROM room;
	if err := tb.db.Find(&rooms); err.Error != nil {
		return []model.Room{}, fmt.Errorf("[%s] %s -- %s", LAYER, "Backend can not get all room from the database error", err.Error)
	}

	log.Printf("[%s] Backend got all room from the database is ok -- we have %v user in system\n", LAYER, len(rooms))

	return rooms, nil
}

func (tb *tableRoom) InsertRoom(room model.Room) error {

	// Insert a Room to database;
	if result := tb.db.Create(&room); result.Error != nil {
		return result.Error
	}

	log.Printf("Insert database Bill ok \n%v", room)
	return nil
}

func (tb *tableRoom) UpdateRoom(room model.Room) error {

	// Update a Room to database;
	if result := tb.db.Save(&room); result.Error != nil {
		return result.Error
	}

	log.Printf("Update database Bill ok \n%v", room)
	return nil
}
