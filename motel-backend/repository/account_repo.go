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
package repository

import (
	model "motel-backend/model"
	"time"
)

// This interface is the connection between [service] layer and [infrast(database)] layer
type AccountInfrastRepo interface {

	// Get all account from datable
	// return  []Account and error = nil when success
	// return emptly []Account and error = "error" when failure
	GetAllAccount() ([]model.Account, error)

	// Insert a account into datable
	// return error = nil when success
	// return error = "error" when failure
	InsertAccount(account model.Account) error

	// Update a account into datable
	// return error = nil when success
	// return error = "error" when failure
	UpdateAccount(account model.Account) error

	// Deactivate a account in datable
	// return error = nil when success
	// return error = "error" when failure
	DeleteAccount(account model.Account) error
}

// This interface is the connection between [delivery] layer and [service] layer
type AccountServiceRepo interface {
	FetchLogin(userName, password string) error
	SignUpAccount(accountId, roomId, roleId int, userName, cid, driverLicense,
		phone, password, email string, createdOn, lastLogin *time.Time) error
}
