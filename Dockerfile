# Base image
FROM ubuntu:24.04

# Install Zephyr dependencies
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
    && rm -rf /var/lib/apt/lists/*

# Install additianal dependencies
RUN apt-get update && apt install --no-install-recommends -y \
        curl \
        whiptail \
        usbutils \
        libusb-1.0-0-dev \
        libncurses6 \
        udev \
        picocom \
    && rm -rf /var/lib/apt/lists/*

#install LinkServer for NXP MCUs
# which version to use:
ARG LINKSERVER_VERSION="26.3.123"

# Need to start udev manually, otherwise getting "Failed to send reload request: No such file or directory" during LinkServer installation
RUN /lib/systemd/systemd-udevd --daemon

#install LinkServer software
RUN curl -O https://www.nxp.com/lgfiles/updates/mcuxpresso/LinkServer_${LINKSERVER_VERSION}.x86_64.deb.bin \
    && chmod +x LinkServer_${LINKSERVER_VERSION}.x86_64.deb.bin \
    && ./LinkServer_${LINKSERVER_VERSION}.x86_64.deb.bin acceptLicense skipIdeSelect \
    && rm LinkServer_${LINKSERVER_VERSION}.x86_64.deb.bin

ENV PATH="/usr/local/LinkServer_${LINKSERVER_VERSION}:${PATH}"
