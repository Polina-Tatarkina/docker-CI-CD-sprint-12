# syntax=docker/dockerfile:1
FROM golang:1.21-alpine

WORKDIR /app

# Копируем файлы модуля
COPY go.mod go.sum ./
RUN go mod download

# Копируем исходники
COPY *.go ./

# Сборка приложения
RUN go build -o app

# Команда по умолчанию
CMD ["./app"]
