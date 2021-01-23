#!/usr/bin/env sh

xhost + local:root && \
  docker run --rm -it --name firefox \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro firefox-box && \
  xhost - local:root
