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
func (tbAccount *tableAccount) DeleteAccount(account model.Account) error {
	panic("unimplemented")
}

// Return slice Account and error = nil when success
// Return emptly []Account and error = "error" when failure
func (tbAccount *tableAccount) GetAllAccount() ([]model.Account, error) {

	var accounts []model.Account

	// Get all records
	// SELECT * FROM account;
	if result := tbAccount.db.Find(&accounts); result.Error != nil {
		return []model.Account{}, result.Error
	}
	fmt.Printf("called database account ok \n%v", accounts)
	return accounts, nil
}

// InsertAccount implements repository.AccountRepo.
func (tbAccount *tableAccount) InsertAccount(account model.Account) error {
	panic("unimplemented")
}

// UpdateAccount implements repository.AccountRepo.
func (tbAccount *tableAccount) UpdateAccount(account model.Account) error {
	panic("unimplemented")
}
