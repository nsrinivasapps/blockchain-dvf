FROM ubuntu:17.10
MAINTAINER bbiskup@gmx.de

RUN apt-get -qy update && \
    apt-get -qy install \
        clang \
        cmake \
        gdb \
        less \
        libboost1.63-dev \
        ninja-build \
        unzip \
        wget \
        xz-utils

RUN apt-get -qy install libcurl4-gnutls-dev curl

RUN wget -q https://github.com/JosephP91/curlcpp/releases/download/1.1/curlcpp-1.1.zip && \
    unzip curlcpp-1.1.zip && \
    cd curlcpp-master && \
    mkdir -p build && \
    cd build && \
    cmake .. && \
    make -j 4

WORKDIR /code
