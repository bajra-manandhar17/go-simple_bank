createdb:
	docker exec -it postgres-new createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres-new dropdb simple_bank

postgres:
	docker run --name postgres-new -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres:latest

migrateup:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" --verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: createdb dropdb postgres migrateup migratedown

