#!/usr/bin/env sh

print_usage() {
    echo "usage: "$(basename $0)" <IMAGE_NAME[:tag]> [<CMD>]"
}

if [ "$#" -lt 1 ]; then
    print_usage
    exit 1
elif [ "$#" -eq 1 -a "$1" = "-h" ]; then
    print_usage
    exit 0
fi

xhost + local:root && \
docker run --rm -it --name browser-sandbox \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro "$@" && \
xhost - local:root
