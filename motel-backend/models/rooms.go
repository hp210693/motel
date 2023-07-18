package models

import "time"

type Rooms struct {
	Room_Id    int        `json:"room_id" gorm:"primaryKey"`
	R2oom_Id    int        `json:"room_id"`
	User_Name  string     `json:"user_name"`
	Password   string     `json:"password"`
	Email      string     `json:"email"`
	Created_On *time.Time `json:"created_on"`
	Last_Login *time.Time `json:"last_login"`
}
