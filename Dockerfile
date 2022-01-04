FROM python:3.10.1-bullseye

RUN apt-get update
RUN apt install -y gcc-multilib g++-multilib libtinfo5
RUN apt install -y python3-venv

WORKDIR /build

RUN mkdir -p /etc/udev/rules.d && \
    touch /etc/udev/rules.d/20-hw1.rules
