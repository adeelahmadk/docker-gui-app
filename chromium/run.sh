#!/usr/bin/env sh

# xhost + local:root && \
#   docker run --rm -it --name chrome \
#   -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro chromium-box \
#   /usr/bin/chromium --no-sandbox --disable-dev-shm-usage --disable-gpu && \
#   xhost - local:root
xhost + local:root && \
  docker run --rm -it --name chrome \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro chromium-box && \
  xhost - local:root
