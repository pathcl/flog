FROM golang

ENV CGO_ENABLED=0
ENV GO111MODULE=on

WORKDIR /go/src/flog

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN go build -o /bin/flog

FROM alpine:3.10.1
COPY --from=0 /bin/flog /bin/flog
RUN mkdir -p /var/log/apache2
ENTRYPOINT ["flog", "-t", "log", "-d", "1", "-w", "-o", "/var/log/apache2/access.log"]
