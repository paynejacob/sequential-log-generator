FROM golang:1.14.4-alpine3.12 as build
WORKDIR /go/src/sequential-log-generator
COPY . .
RUN go build -o sequential-log-generator main.go

FROM alpine:3.12
COPY --from=build /go/src/sequential-log-generator/sequential-log-generator /usr/local/bin/sequential-log-generator
ENTRYPOINT ["sequential-log-generator", "stdout", "1000"]