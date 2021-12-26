FROM golang:1.17-alpine

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN go build -o /build-files

EXPOSE 9035

CMD [ "/build-files" ]