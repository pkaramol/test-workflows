# syntax=docker/dockerfile:1

ARG GO_VERSION=1.18

FROM golang:${GO_VERSION}-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o /docker-ds-ping

EXPOSE 8080

CMD ["/docker-ds-ping"]