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
package service

import (
	"fmt"
	"log"
	"motel-backend/model"
	repository "motel-backend/repository"
	"time"
)

var LAYER = "SERVICE"

type userService struct {
	userRepo repository.UserInfrastRepo
}

func NewUserService(repo repository.UserInfrastRepo) repository.UserServiceRepo {
	return &userService{userRepo: repo}
}

func (acc *userService) SignInUser(userName string, password string) (model.User, error) {
	var accounts, err = acc.userRepo.GetAllUser()
	if err != nil {
		return model.User{}, fmt.Errorf("[%s] -- %s", LAYER, err)
	}

	for _, account := range accounts {
		if account.UserName == userName && account.Password == password {
			return account, nil
		}
	}

	return model.User{}, fmt.Errorf("[%s] -- The user does not exist", LAYER)
}

func (acc *userService) SignUpUser(userId int, roomId int, roleId int, userName string,
	cid string, driverLicense string, phone string, password string, email string,
	createdOn *time.Time, lastLogin *time.Time) error {

	account := model.User{UserId: userId, RoomId: roleId, RoleId: roleId,
		UserName: userName, CID: cid, DriverLicense: driverLicense, Phone: phone,
		Password: password, Email: email, CreatedOn: createdOn, LastLogin: lastLogin}

	if error := acc.userRepo.InsertUser(account); error != nil {
		log.Printf("\nInsertUser() error\n")
		return error
	}

	log.Printf("\nSignUpUser() error\n")
	return nil
}
