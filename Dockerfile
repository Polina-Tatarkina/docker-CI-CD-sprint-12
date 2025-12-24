# syntax=docker/dockerfile:1
FROM golang:1.21-alpine

WORKDIR /app

# Копируем только файлы модуля
COPY go.mod go.sum ./

# Скачиваем зависимости
RUN go mod tidy

# Копируем исходники
COPY *.go ./

# Сборка приложения
RUN go build -o app

CMD ["./app"]
