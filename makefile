all: deps build

.PHONY: deps
deps:
	go get -d -v github.com/dustin/go-broadcast/...

.PHONY: build
build: deps
	go build -o output/chatroot cmd/chat/main.go 