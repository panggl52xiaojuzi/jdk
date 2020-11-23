all: deps build

.PHONY: deps
deps:
	go get -d -v github.com/dustin/go-broadcast/...

.PHONY: build
build: deps
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o output/chatroot cmd/chat/main.go 