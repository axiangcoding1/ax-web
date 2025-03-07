.PHONY: all swag clean upgrade check build-image run help run-dev-env

all: swag run

swag:
	@echo "latest swag tool required"
	swag init -o ./swagger -g ./main.go
	swag fmt -g ./main.go

clean:
	go clean

upgrade:
	go get -u ./

check:
	go fmt ./
	go vet ./

build-image:
	@echo "docker required"
	docker build . -t axiangcoding/go-gin-template:latest

run:
	go run ./main.go

run-dev-env:
	@echo "docker-compose required"
	docker-compose -f docker/docker-compose.yaml up -d

help:
	@echo "make - generate swagger docs, run application"
	@echo "make swag - generate swagger docs"
	@echo "make clean - go clean"
	@echo "make prepare - format codes"
	@echo "make build-image - build docker image"
	@echo "make run - run application"
	@echo "make run-dev-env - run development environment"