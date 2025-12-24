
FROM golang:1.24-alpine

# Создаём рабочую директорию
WORKDIR /app

# Копируем только файлы зависимостей для кеша
COPY go.mod go.sum ./
RUN go mod download

# Копируем весь проект
COPY . .


ENV CGO_ENABLED=0

# Собираем приложение
RUN go build -o app .

# Копируем базу данных
COPY tracker.db /app/tracker.db

# Команда по умолчанию
CMD ["./app"]
