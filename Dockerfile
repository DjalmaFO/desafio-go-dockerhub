FROM golang:1.16-alpine AS dfogolang

WORKDIR /go/src

COPY go.mod .
RUN go mod tidy

COPY *.go ./

RUN go build

FROM alpine:latest

COPY --from=dfogolang /go/src/app .

CMD ["./app"]

