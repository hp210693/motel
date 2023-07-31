package repository

import (
	model "motel-backend/model/room"
)

// This interface is the connection between [service] layer and [infrast(database)] layer
type RoomInfrastRepo interface {

	// Get all room from datable
	// return  []Room and error = nil when success
	// return emptly []Account and error = "error" when failure
	GetAllRoom() ([]model.Room, error)

	// Insert a room into datable
	// return error = nil when success
	// return error = "error" when failure
	InsertRoom(room model.Room) error

	// Update a room into datable
	// return error = nil when success
	// return error = "error" when failure
	UpdateRoom(room model.Room) error

	// Deactivate a room in datable
	// return error = nil when success
	// return error = "error" when failure
	DeleteRoom(room model.Room) error
}

// This interface is the connection between [delivery] layer and [service] layer
type RoomServiceRepo interface {
	FetchAllRoom() ([]model.Room, error)
}
