FROM ubuntu:18.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . .

RUN cd hello_world_application && cmake -B_build && cmake --build _build
RUN hello_world_application/_build/hello_world
