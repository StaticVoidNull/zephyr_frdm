# Base image
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt install --no-install-recommends -y \
        git \
        cmake \
        ninja-build \
        gperf \
        ccache \
        dfu-util \
        device-tree-compiler \
        wget \
        python3-dev \
        python3-venv \
        python3-tk \
        xz-utils \
        file \
        make \
        gcc \
        gcc-multilib \
        g++-multilib \
        libsdl2-dev \
        libmagic1 \
        sudo \
    && rm -rf /var/lib/apt/lists/*
