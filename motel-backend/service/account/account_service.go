package service

import (
	"fmt"
	repository "motel-backend/repository/account"
)

type accountService struct {
	accountRepo repository.AccountInfrastRepo
}

func NewAccountService(repo repository.AccountInfrastRepo) repository.AccountServiceRepo {
	return &accountService{accountRepo: repo}
}

// Login implements repository.AccountServiceRepo.
func (acc *accountService) FetchLogin(userName string, password string) error {
	var accounts, error = acc.accountRepo.GetAllAccount()
	if error != nil {
		return error
	}
	fmt.Printf("\n----\n%v", accounts)
	for _, account := range accounts {
		if account.User_Name == userName && account.Password == password {
			fmt.Printf("\nokokokokokokok\n")
			return nil
		}
	}
	return error
}
