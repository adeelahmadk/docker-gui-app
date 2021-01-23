FROM debian:buster-slim

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt-get -q -y install chromium \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/chromium", "--no-sandbox", "--disable-dev-shm-usage", "--disable-gpu"]
