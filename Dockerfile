FROM golang:1.20rc2-alpine3.17 AS build
WORKDIR /usr/src/app
COPY ./example/helloworld.go .
RUN go mod init helloworld.go
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /helloworld

FROM scratch AS APPLICATION
WORKDIR /usr/src/app
COPY --from=build /helloworld /helloworld
ENTRYPOINT ["/helloworld"]





