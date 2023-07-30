package repository

import model "motel-backend/model/account"

// This interface is the connection between [service] layer and [infrast(database)] layer
type AccountInfrastRepo interface {

	/// Get all account from datable
	/// return  []Account and error = nil when success
	/// return emptly []Account and error = "error" when failure
	GetAllAccount() ([]model.Account, error)

	/// Insert a account into datable
	/// return error = nil when success
	/// return error = "error" when failure
	InsertAccount(account model.Account) error

	/// Update a account into datable
	/// return error = nil when success
	/// return error = "error" when failure
	UpdateAccount(account model.Account) error

	/// Deactivate a account in datable
	/// return error = nil when success
	/// return error = "error" when failure
	DeleteAccount(account model.Account) error
}

// This interface is the connection between [delivery] layer and [service] layer
type AccountServiceRepo interface {
	Login(userName, password string) error
}
