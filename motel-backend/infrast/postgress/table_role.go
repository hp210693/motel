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

type tableRole struct {
	db *gorm.DB
}

func NewTableRole(db *gorm.DB) repository.RoleInfrastRepo {
	return &tableRole{db: db}
}

// DeleteRole implements repository.RoleRepo.
func (tb *tableRole) DeleteRole(role model.Role) error {

	// Delete a Role to database;
	if result := tb.db.Delete(&role); result.Error != nil {
		return result.Error
	}

	log.Printf("save database Role ok \n%v", role)
	return nil
}

// Return slice Role and error = nil when success
// Return emptly []Role and error = "error" when failure
func (tb *tableRole) GetAllRole() ([]model.Role, error) {

	var roles []model.Role

	// Get all records
	// SELECT * FROM Role;
	if result := tb.db.Find(&roles); result.Error != nil {
		return []model.Role{}, result.Error
	}

	log.Printf("Called database account ok \n%v", roles)
	return roles, nil
}

// InsertAccount implements repository.AccountRepo.
func (tb *tableRole) InsertRole(role model.Role) error {

	// Insert a Role to database;
	if result := tb.db.Create(&role); result.Error != nil {
		return result.Error
	}

	log.Printf("Insert database Role ok \n%v", role)
	return nil
}

// UpdateAccount implements repository.AccountRepo.
func (tb *tableRole) UpdateRole(role model.Role) error {

	// Update a Role to database;
	if result := tb.db.Save(&role); result.Error != nil {
		return result.Error
	}

	log.Printf("save database Role ok \n%v", role)
	return nil
}
