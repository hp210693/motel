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
package model

import (
	"encoding/json"
	"time"
)

type Account struct {
	AccountId     int        `json:"account_id" gorm:"primaryKey"`
	RoomId        int        `json:"room_id"`
	UserName      string     `json:"user_name"`
	CID           string     `json:"cid"`
	DriverLicense string     `json:"driver_license"`
	Phone         string     `json:"phone"`
	Password      string     `json:"password"`
	Email         string     `json:"email"`
	CreatedOn     *time.Time `json:"created_on"`
	LastLogin     *time.Time `json:"last_login"`
}

// TableName overrides the table name used by Account to `account`
func (Account) TableName() string {
	return "account"
}

func (a *Account) MarshalJSON() ([]byte, error) {
	type Alias Account
	return json.Marshal(&struct {
		CreatedOn string `json:"created_on"`
		LastLogin string `json:"last_login"`
		*Alias
	}{
		CreatedOn: a.CreatedOn.Format("2006-01-02 15:04:05"),
		LastLogin: a.LastLogin.Format("2006-01-02 15:04:05"),
		Alias:     (*Alias)(a),
	})
}
