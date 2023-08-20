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

type tableFlow struct {
	db *gorm.DB
}

func NewTableFlow(db *gorm.DB) repository.FlowInfrastRepo {
	return &tableFlow{db: db}
}

// DeleteFlow implements repository.FlowRepo.
func (tb *tableFlow) DeleteFlow(flow model.Flow) error {

	// Delete a Flow to database;
	if result := tb.db.Delete(&flow); result.Error != nil {
		return result.Error
	}

	log.Printf("save database Flow ok \n%v", flow)
	return nil
}

// Return slice Flow and error = nil when success
// Return emptly []Flow and error = "error" when failure
func (tb *tableFlow) GetAllFlow() ([]model.Flow, error) {

	var flows []model.Flow

	// Get all records
	// SELECT * FROM Flow;
	if result := tb.db.Find(&flows); result.Error != nil {
		return []model.Flow{}, result.Error
	}

	log.Printf("Called database account ok \n%v", flows)
	return flows, nil
}

// InsertAccount implements repository.AccountRepo.
func (tb *tableFlow) InsertFlow(flow model.Flow) error {

	// Insert a Flow to database;
	if result := tb.db.Create(&flow); result.Error != nil {
		return result.Error
	}

	log.Printf("Insert database Flow ok \n%v", flow)
	return nil
}

// UpdateAccount implements repository.AccountRepo.
func (tb *tableFlow) UpdateFlow(flow model.Flow) error {

	// Update a Flow to database;
	if result := tb.db.Save(&flow); result.Error != nil {
		return result.Error
	}

	log.Printf("save database Flow ok \n%v", flow)
	return nil
}
