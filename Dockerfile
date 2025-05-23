FROM ubuntu:24.04
ENV LOG_PATH /home/logs/log.txt
VOLUME /home/logs
WORKDIR _install/bin


RUN apt update
RUN apt install -y gcc g++ cmake

COPY . .


RUN cd hello_world_application && cmake -B_build && cmake --build _build
RUN hello_world_application/_build/hello_world > LOG_PATH
