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
