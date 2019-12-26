FROM golang:1.11 as build-deps
LABEL MAINTAINER yunlong <zhenmu.zyl@alibaba-inc.com>
ENV GO111MODULE on

WORKDIR /go/src/code.aliyun.com/flow-example/go-gonic

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o output/chatroot cmd/chat/main.go 

FROM alpine
COPY --from=build-deps /go/src/code.aliyun.com/flow-example/go-gonic/output/chatroot /usr/local/bin/chatroot
LABEL MAINTAINER yunlong <zhenmu.zyl@alibaba-inc.com>

CMD ["chatroot"]