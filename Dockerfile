FROM ubuntu:24.04

RUN apt update
RUN apt install -y gcc g++ cmake

COPY . .

RUN cd hello_world_application && cmake -B_build && cmake --build _build

VOLUME ["/logs"]

CMD hello_world_application/_build/hello_world > /logs/output.log 2>&1
