FROM ubuntu:24.04

RUN apt update && apt install -y gcc g++ cmake

COPY . /hello_world_application
WORKDIR /hello_world_application

RUN cmake -B_build && cmake --build _build

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

WORKDIR _build

ENTRYPOINT ./hello_world
