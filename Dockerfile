FROM golang:1.12 AS base

WORKDIR /work

COPY main.go .
COPY go.mod .
COPY go.sum .
COPY vendor vendor

RUN CGO_ENABLED=0 GOOS=linux GOFLAGS='-mod=vendor' go build -ldflags="-s -w -X main.gitHash=${GITVERSION}" -a -installsuffix cgo -o app main.go

FROM alpine:3.9

COPY --from=base /work/app /usr/bin/

ENTRYPOINT [ "app" ]