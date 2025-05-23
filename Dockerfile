FROM ubuntu:24.04

RUN apt-get update 
RUN apt-get install -y gcc g++ cmake

COPY . .

COPY . print/
WORKDIR print
RUN cd hello_world_application && \
    cmake -B_build && \
    cmake --build _build
ENV LOG_PATH /home/logs/log.txt
VOLUME /home/logs
WORKDIR _install/bin
ENTRYPOINT ./demo
