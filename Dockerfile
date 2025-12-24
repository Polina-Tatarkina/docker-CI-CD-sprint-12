# syntax=docker/dockerfile:1
FROM golang:1.21-alpine

WORKDIR /app

# Включаем Go modules
ENV GO111MODULE=on

# Копируем всё сразу (все .go, go.mod, go.sum)
COPY . .

# Скачиваем зависимости
RUN go mod tidy

# Сборка приложения
RUN go build -o app

# Команда по умолчанию
CMD ["./app"]
