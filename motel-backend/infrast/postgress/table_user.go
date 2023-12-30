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

var LAYER = "INFRAST"

type tableUser struct {
	db *gorm.DB
}

func NewTableUser(db *gorm.DB) repository.UserInfrastRepo {
	return &tableUser{db: db}
}

func (tb *tableUser) DeleteUser(user model.User) error {

	if result := tb.db.Delete(&user); result.Error != nil {
		return result.Error
	}

	log.Printf("Delete database user ok \n%v", user)
	return nil
}

func (tb *tableUser) GetAllUser() ([]model.User, error) {

	var users []model.User

	// SELECT * FROM User;
	if err := tb.db.Find(&users); err.Error != nil {
		return []model.User{}, fmt.Errorf("[%s] %s -- %s", LAYER, "Backend can not get all user from the database error", err.Error)
	}

	log.Printf("[%s] Backend got all user from the database is ok -- we have %v user in system\n", LAYER, len(users))
	return users, nil
}

func (tb *tableUser) InsertUser(user model.User) error {

	// Insert a User to database;
	if err := tb.db.Create(&user); err.Error != nil {
		return err.Error
	}

	log.Printf("Insert database User ok \n%v", user)
	return nil
}

func (tb *tableUser) UpdateUser(user model.User) error {

	// Update a User to database;
	if err := tb.db.Save(&user); err.Error != nil {
		return err.Error
	}

	log.Printf("Update database User ok \n%v", user)
	return nil
}
