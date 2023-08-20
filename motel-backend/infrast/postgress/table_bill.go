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
	"log"
	model "motel-backend/model"
	repository "motel-backend/repository"

	"gorm.io/gorm"
)

type tableBill struct {
	db *gorm.DB
}

func NewTableBill(db *gorm.DB) repository.BillInfrastRepo {
	return &tableBill{db: db}
}

// DeleteBill implements repository.BillRepo.
func (tb *tableBill) DeleteBill(bill model.Bill) error {

	// Delete a Bill to database;
	if result := tb.db.Delete(&bill); result.Error != nil {
		return result.Error
	}

	log.Printf("save database Bill ok \n%v", bill)
	return nil
}

// Return slice Bill and error = nil when success
// Return emptly []Bill and error = "error" when failure
func (tb *tableBill) GetAllBill() ([]model.Bill, error) {

	var bills []model.Bill

	// Get all records
	// SELECT * FROM bill;
	if result := tb.db.Find(&bills); result.Error != nil {
		return []model.Bill{}, result.Error
	}

	log.Printf("Called database account ok \n%v", bills)
	return bills, nil
}

// InsertAccount implements repository.AccountRepo.
func (tb *tableBill) InsertBill(bill model.Bill) error {

	// Insert a Bill to database;
	if result := tb.db.Create(&bill); result.Error != nil {
		return result.Error
	}

	log.Printf("Insert database Bill ok \n%v", bill)
	return nil
}

// UpdateAccount implements repository.AccountRepo.
func (tb *tableBill) UpdateBill(bill model.Bill) error {

	// Update a Bill to database;
	if result := tb.db.Save(&bill); result.Error != nil {
		return result.Error
	}

	log.Printf("save database Bill ok \n%v", bill)
	return nil
}
