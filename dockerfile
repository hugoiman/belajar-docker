FROM golang:alpine3.11

RUN mkdir -p /app
WORKDIR /go/src/build_bd

COPY . .

WORKDIR /go/src/build_bd/cmd
RUN GOOS=linux GOARCH=amd64 go build -o bd

RUN mv bd ../../../../app/
RUN rm -rf /../../../../build_bd
ENTRYPOINT ["/app/bd"]