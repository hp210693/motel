package model

import (
	"time"
)

type Account struct {
	Account_Id int        `json:"account_id" gorm:"primaryKey"`
	Room_Id    int        `json:"room_id"`
	User_Name  string     `json:"user_name"`
	Password   string     `json:"password"`
	Email      string     `json:"email"`
	Created_On *time.Time `json:"created_on"`
	Last_Login *time.Time `json:"last_login"`
}

/* type Tabler interface {
	TableName() string
} */

// TableName overrides the table name used by Account to `account`
func (Account) TableName() string {
	return "account"
}
