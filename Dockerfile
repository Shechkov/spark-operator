FROM golang:1.19 as builder
WORKDIR /app
COPY . .
# Установите зависимости и соберите бинарный файлRUN go mod tidy
RUN go build -o spark-operator ./main.go
FROM ubuntu:20.04
COPY --from=builder /app/spark-operator /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/spark-operator"]