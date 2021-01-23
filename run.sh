#!/usr/bin/env sh

[ "$#" -eq 1 -a "$1" = "-h" -o "$#" -lt 1 ] && echo "usage: ./"$(basename $0)" <IMAGE_NAME[:tag]> [<CMD>]"; exit 0;

xhost + local:root && \
  docker run --rm -it --name browser-sandbox \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro "$@" && \
  xhost - local:root
