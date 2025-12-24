# Используем Go 1.22 на Alpine
FROM golang:1.22-alpine

WORKDIR /app

# Копируем только файлы зависимостей для кеша
COPY go.mod go.sum ./
RUN go mod download

# Копируем весь проект
COPY . .

# Отключаем Cgo и собираем статический бинарник
ENV CGO_ENABLED=0
RUN go build -o app .

# Если есть база данных
COPY tracker.db /app/tracker.db

# Команда запуска
CMD ["./app"]
