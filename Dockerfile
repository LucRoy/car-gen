FROM golang:1.19

RUN go install github.com/ipld/go-car/cmd/car@latest

RUN mkdir /car-gen
WORKDIR /car-gen