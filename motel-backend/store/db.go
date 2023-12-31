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
package store

import (
	"fmt"
	"log"
	model "motel-backend/model"
	util "motel-backend/utli"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type DB struct {
	Store *gorm.DB
}

func NewDB(config *util.Config) *DB {
	dsn := "host=" + config.DBSource + " user=" + config.DBUser + " password=" + config.DBPassword + " dbname=" + config.DBName + " port=" + config.DBPort
	database, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if err != nil {
		panic(fmt.Errorf("%s %w", "Cannot connect to Possgress", err))
	}

	log.Println("Running migrations")
	if err := database.AutoMigrate(
		&model.User{}, &model.Room{}, &model.Bill{},
		&model.Flow{}, &model.Role{}); err != nil {
		log.Println("Sorry couldn't migrate'...")
		panic(fmt.Errorf("%s %w", "Sorry couldn't migrate'...", err))
	}

	log.Println("Database connection was successful...")
	log.Println("Connected:", database)
	return &DB{
		Store: database,
	}
}
