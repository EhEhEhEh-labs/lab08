FROM ubuntu:24.04

RUN apt-get update 
RUN apt-get install -y gcc g++ cmake

COPY . .

RUN cd hello_world_application 
RUN cmake -B_build
RUN cmake --build _build

RUN mkdir -p /home/logs

ENTRYPOINT ["/app/hello_world_application/_build/hello_world"]
