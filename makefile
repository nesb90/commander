setup:
	docker volume create --name=commander-data

init-db:
	docker-compose run --rm commander-container run init:db

db-migrate:
	docker-compose run --rm n-pos run db:migrate

db-migrate-revert:
	docker-compose run --rm n-pos run db:migrate:revert

build:
	docker build .

dev:
	docker-compose -f docker-compose.yaml -f docker/docker-compose.dev.yaml up commander-container

down:
	docker-compose down --remove-orphans
