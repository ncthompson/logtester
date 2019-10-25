.PHONY: build docker vendor

vendor:
	go mod tidy
	go mod vendor

build:
	go build -mod=vendor -o logtester ./main.go

docker:
	docker build -t logtester .