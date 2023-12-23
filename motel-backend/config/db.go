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
package config

import (
	"log"
	model "motel-backend/model"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var database *gorm.DB
var e error

type Env struct {
	Host     string
	UserName string
	Password string
	DbName   string
	Port     string
}

func NewEnv() *Env {
	return &Env{
		Host:     "host=motel.cxyhp96h5ofj.ap-southeast-1.rds.amazonaws.com",
		UserName: " user=root",
		Password: " password=9KxhcJUkpdCFZVl5RliK",
		DbName:   " dbname=motel",
		Port:     " port=5432",
	}
}

func DatabaseInit() {

	env := NewEnv()

	dsn := env.Host + env.UserName + env.Password + env.DbName + env.Port

	database, e = gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if e != nil {
		log.Fatalln("Cannot connect to Possgress:", e)
	}
	log.Println("Running migrations")

	if migrateErr := database.AutoMigrate(&model.Account{}, &model.Room{}, &model.Bill{}, &model.Flow{}, &model.Role{}); migrateErr != nil {
		log.Println("Sorry couldn't migrate'...")
	}

	log.Println("Database connection was successful...")
	log.Println("Connected:", database)
}

func DB() *gorm.DB {
	return database
}
