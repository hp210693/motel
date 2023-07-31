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
	"time"
)

type Room struct {
	Room_Id        int        `json:"room_id" gorm:"primaryKey"`
	FlowId         int        `json:"flow_id"`
	Area           string     `json:"area"`
	StatusRoom     int        `json:"status_room"`
	RoomName       string     `json:"room_name"`
	BookingDate    *time.Time `json:"booking_date"`
	DateMoveIn     *time.Time `json:"date_move_in"`
	DateMoveOut    *time.Time `json:"date_move_out"`
	TotalDays      float64    `json:"total_days"`
	ElectricNumber float64    `json:"electric_number"`
	ElectricPrice  float64    `json:"electric_price"`
	Deposits       float64    `json:"deposits"`
	ImgElectric    string     `json:"img_electric"`
	ImgRoomRates   string     `json:"img_room_rates"`
	ImgWater       string     `json:"img_water"`
	JunkMoney      float64    `json:"junk_money"`
	NumOfMember    int        `json:"num_of_member"`
	RoomRates      float64    `json:"room_rates"`
	WaterNumber    float64    `json:"water_number"`
	WaterPrice     float64    `json:"water_price"`
}

// TableName overrides the table name used by Account to `account`
func (Room) TableName() string {
	return "room"
}
