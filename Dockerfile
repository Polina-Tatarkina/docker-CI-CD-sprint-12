# syntax=docker/dockerfile:1
FROM golang:1.21-alpine

WORKDIR /app

# Копируем все файлы модуля сразу
COPY . .

# Скачиваем зависимости
RUN go mod tidy

# Сборка приложения
RUN go build -o app

# Команда по умолчанию
CMD ["./app"]
