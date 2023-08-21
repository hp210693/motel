VERSION=1
PATH_MIGRATIONS=db/migration
PROJECT_NAME=motelproject
DB_NAME=motel
PASS_DB=msecret
DB_URL=postgresql://root:"$(PASS_DB)"@localhost:5432/"$(DB_NAME)"?sslmode=disable

postgres: # Startup database run [make postgres]
	docker run --name "$(PROJECT_NAME)" -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD="$(PASS_DB)" -d postgres:14-alpine

createdb: # Create database
	docker exec -it "$(PROJECT_NAME)" createdb --username=root --owner=root "$(DB_NAME)"

dropdb: # Drop database
	docker exec -it "$(PROJECT_NAME)" dropdb "$(DB_NAME)"

migrateup:
	migrate -path "$(PATH_MIGRATIONS)" -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path "$(PATH_MIGRATIONS)" -database "$(DB_URL)" -verbose down

migrateforce:
	migrate -path "$(PATH_MIGRATIONS)" -database "$(DB_URL)" force "$(VERSION)"

.PHONY: postgres createdb dropdb migrateup migratedown