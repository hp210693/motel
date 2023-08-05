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
	mdAccount "motel-backend/model/account"
	mdRoom "motel-backend/model/room"
	"time"
)

type Bill struct {
	Bill_id           int               `json:"bill_id" gorm:"primaryKey"`
	Account_id        mdAccount.Account `json:"account_id" gorm:"foreignKey:Account_id;references:account_id"`
	Room_Id           mdRoom.Room       `json:"room_id" gorm:"foreignKey:Room_Id;references:room_id"`
	Created_date      *time.Time        `json:"created_date" gorm:"dateTime:timestamp"`
	Total_payment     float64           `json:"total_payment"`
	Img_total_payment string            `json:"img_total_payment"`
	Note              string            `json:"note"`
}

// TableName overrides the table name used by Bill to `bill`
func (Bill) TableName() string {
	return "bill"
}
