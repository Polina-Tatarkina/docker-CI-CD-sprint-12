# syntax=docker/dockerfile:1
FROM golang:1.21-alpine

WORKDIR /app

# Копируем только go.mod и go.sum сначала
COPY go.mod go.sum ./

# Скачиваем зависимости
RUN go mod tidy

# Копируем остальной код проекта
COPY *.go ./

# Сборка приложения
RUN go build -o app

# Команда по умолчанию
CMD ["./app"]
