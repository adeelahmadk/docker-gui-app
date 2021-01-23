FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt-get -q -y install firefox \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/firefox"]
