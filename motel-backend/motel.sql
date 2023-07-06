CREATE TABLE accounts(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(512) UNIQUE NOT NULL,
	password VARCHAR(1024) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP
);

INSERT INTO accounts VALUES
	(1,'A1-034982142','123456789','abc1@gmail.com',NOW(),NOW()),
	(2,'B1-034982142','123456789','abc2@gmail.com',NOW(),NOW()),
	(3,'C1-034982142','123456789','abc3@gmail.com',NOW(),NOW()),
	(4,'D1-034982142','123456789','abc4@gmail.com',NOW(),NOW()),
	(5,'E1-034982142','123456789','abc5@gmail.com',NOW(),NOW()),
	(6,'K1-034982142','123456789','abc6@gmail.com',NOW(),NOW()),
	(7,'G1-034982142','123456789','abc7@gmail.com',NOW(),NOW()),
	(8,'H1-034982142','123456789','abc8@gmail.com',NOW(),NOW()),
	(9,'KIOT1-034982142','123456789','abc9@gmail.com',NOW(),NOW()),
	(10,'F1-034982142','123456789','abc10@gmail.com',NOW(),NOW());

SELECT * FROM accounts;

CREATE TABLE roles(
	role_id SERIAL PRIMARY KEY,
	role_name VARCHAR(255) NOT NULL
);

INSERT INTO roles VALUES
	(1,'User'),
	(2,'Manager'),
	(3,'Host'),
	(4,'Admin'),
	(5,'Client'),;
SELECT * FROM roles;
	
CREATE TABLE account_roles(
	user_id INT NOT NULL,
	role_id INT NOT NULL,
	grant_date TIMESTAMP,
	PRIMARY KEY (user_id,role_id),
	FOREIGN KEY (role_id)
		REFERENCES roles (role_id),
	FOREIGN KEY (user_id)
		REFERENCES accounts (user_id)
);

INSERT INTO account_roles VALUES
	(1,4,NOW()),
	(2,4,NOW()),
	(5,4,NOW());
SELECT *FROM account_roles;