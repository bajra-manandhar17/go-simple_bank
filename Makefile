createdb:
	docker exec -it postgres-new createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres-new dropdb simple_bank

postgres:
	docker run --name postgres-new -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres:latest

migrateup:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/bajra-manandhar17/go-simple_bank/db/sqlc Store

server:
	go run main.go

.PHONY: createdb dropdb postgres migrateup migratedown sqlc test server mock migratedown1 migrateup1