# Base image
FROM fedora:latest

# Arguments to pass host UID and GID at build time
ARG USERNAME=developer
ARG UID=1000
ARG GID=1000

# Install dependencies
RUN dnf -y group install \
        development-tools \
        c-development \
    && dnf -y install \
        cmake \
        ninja-build \
        gperf \
        dfu-util \
        dtc \
        wget \
        which \
        python3-pip \
        python3-tkinter \
        xz \
        file \
        python3-devel \
        SDL2-devel

# Install sudo and create the user/group with matching UID/GID
RUN dnf -y install \
        sudo \
    && groupadd --gid ${GID} ${USERNAME} \
    && useradd --uid ${UID} --gid ${GID} -m ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Switch to the new user
USER ${USERNAME}

# Default working directory
WORKDIR /workspace
