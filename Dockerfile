FROM tinygo/tinygo:latest AS dfogolang

WORKDIR /go/src

COPY go.mod .

COPY *.go ./

RUN go build

RUN  tinygo build -o app

RUN rm -rf go.mod

FROM hello-world:latest

COPY --from=dfogolang /go/src/app .

ENTRYPOINT ["./app"]

