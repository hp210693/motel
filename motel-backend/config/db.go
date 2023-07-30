package config

import (
	"log"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var database *gorm.DB
var e error

func DatabaseInit() {
	dsn := "host=localhost user=postgres password=1 dbname=motel port=5432 sslmode=disable"
	database, e = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if e != nil {
		log.Fatalln("Cannot connect to Possgress:", e)
	}
	//database.AutoMigrate(&model.Room{})

	log.Println("Connected:", database)
}

func DB() *gorm.DB {
	return database
}
