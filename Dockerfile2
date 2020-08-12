FROM registry.cn-beijing.aliyuncs.com/hub-mirrors/golang:1.11 as build-deps
LABEL MAINTAINER yunlong <zhenmu.zyl@alibaba-inc.com>
ENV GO111MODULE on
ENV GOPROXY https://goproxy.io

WORKDIR /go/src/code.aliyun.com/flow-example/go-gonic

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o output/chatroot cmd/chat/main.go 

FROM registry.cn-beijing.aliyuncs.com/hub-mirrors/alpine
COPY --from=build-deps /go/src/code.aliyun.com/flow-example/go-gonic/output/chatroot /usr/local/bin/chatroot
LABEL MAINTAINER yunlong <zhenmu.zyl@alibaba-inc.com>

CMD ["chatroot"]