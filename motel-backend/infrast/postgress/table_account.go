package infrast

import (
	"fmt"
	model "motel-backend/model/account"
	repository "motel-backend/repository/account"

	"gorm.io/gorm"
)

type tableAccount struct {
	db *gorm.DB
}

func NewTableAccount(db *gorm.DB) repository.AccountInfrastRepo {
	return &tableAccount{db: db}
}

// DeleteAccount implements repository.AccountRepo.
func (acc *tableAccount) DeleteAccount(account model.Account) error {
	panic("unimplemented")
}

// Return slice Account and error = nil when success
// Return emptly []Account and error = "error" when failure
func (acc *tableAccount) GetAllAccount() ([]model.Account, error) {

	var accounts []model.Account

	// Get all records
	// SELECT * FROM account;
	if result := acc.db.Find(&accounts); result.Error != nil {
		return []model.Account{}, result.Error
	}
	fmt.Printf("called database account ok \n%v", accounts)
	return accounts, nil
}

// InsertAccount implements repository.AccountRepo.
func (acc *tableAccount) InsertAccount(account model.Account) error {
	panic("unimplemented")
}

// UpdateAccount implements repository.AccountRepo.
func (acc *tableAccount) UpdateAccount(account model.Account) error {
	panic("unimplemented")
}
