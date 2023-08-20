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
package repository

import model "motel-backend/model"

// This interface is the connection between [service] layer and [infrast(database)] layer
type FlowInfrastRepo interface {

	// Get all Flow from datable
	// return  []Flow and error = nil when success
	// return emptly []Flow and error = "error" when failure
	GetAllFlow() ([]model.Flow, error)

	// Insert a Flow into datable
	// return error = nil when success
	// return error = "error" when failure
	InsertFlow(flow model.Flow) error

	// Update a Flow into datable
	// return error = nil when success
	// return error = "error" when failure
	UpdateFlow(flow model.Flow) error

	// Deactivate a Flow in datable
	// return error = nil when success
	// return error = "error" when failure
	DeleteFlow(flow model.Flow) error
}

// This interface is the connection between [delivery] layer and [service] layer
type FlowServiceRepo interface {
	FetchFlow() ([]model.Flow, error)
}
