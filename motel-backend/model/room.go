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

	"github.com/lib/pq"
)

type Room struct {
	RoomId         int            `json:"room_id" gorm:"primaryKey"`
	FlowId         int            `json:"flow_id"`
	UserId         int            `json:"user_id"`
	Area           string         `json:"area"`
	StatusRoom     int            `json:"status_room"`
	RoomName       string         `json:"room_name"`
	BookingDate    *time.Time     `json:"booking_date"`
	DateMoveIn     *time.Time     `json:"date_move_in"`
	DateMoveOut    *time.Time     `json:"date_move_out"`
	TotalDays      float64        `json:"total_days"`
	ElectricNumber float64        `json:"electric_number"`
	ElectricPrice  float64        `json:"electric_price"`
	Deposits       float64        `json:"deposits"`
	ImgElectric    pq.StringArray `json:"img_electric" gorm:"type:text[]"`
	ImgRoomRates   pq.StringArray `json:"img_room_rates" gorm:"type:text[]"`
	ImgWater       pq.StringArray `json:"img_water" gorm:"type:text[]"`
	ImgRoom        pq.StringArray `json:"img_room" gorm:"type:text[]"`
	JunkMoney      float64        `json:"junk_money"`
	NumOfMember    int            `json:"num_of_member"`
	RoomRates      float64        `json:"room_rates"`
	WaterNumber    float64        `json:"water_number"`
	WaterPrice     float64        `json:"water_price"`
}

// TableName overrides the table name used by Account to `account`
func (Room) TableName() string {
	return "room"
}

func (a *Room) MarshalJSON() ([]byte, error) {

	type Alias Room
	return json.Marshal(&struct {
		BookingDate string `json:"booking_date"`
		DateMoveIn  string `json:"date_move_in"`
		DateMoveOut string `json:"date_move_out"`
		*Alias
	}{
		BookingDate: a.BookingDate.Format("2006-01-02 15:04:05"),
		DateMoveIn:  a.DateMoveIn.Format("2006-01-02 15:04:05"),
		DateMoveOut: a.DateMoveOut.Format("2006-01-02 15:04:05"),
		Alias:       (*Alias)(a),
	})
}
