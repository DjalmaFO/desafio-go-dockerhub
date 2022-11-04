FROM golang:1.16-alpine AS dfogolang

WORKDIR /go/src

ENV PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV GOLANG_VERSION=1.16

ENV GOPATH=/go/src

COPY main.go .

RUN go mod init app

RUN go build

FROM alpine:latest

COPY --from=go dfogolang .

CMD ["./app"]

