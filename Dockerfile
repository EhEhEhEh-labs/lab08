FROM ubuntu:24.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y gcc g++ cmake && \
    rm -rf /var/lib/apt/lists/*

COPY . .

# Собираем приложение
RUN cd hello_world_application && \
    cmake -B_build && \
    cmake --build _build

# Создаем директорию для логов
RUN mkdir -p /home/logs

# Указываем точку входа для запуска приложения
ENTRYPOINT ["/app/hello_world_application/_build/hello_world"]
