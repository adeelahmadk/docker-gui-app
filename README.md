# Run a GUI application in a Docker container

The main use-case for containers are servers, daemons and applications run in headless mode. However, containers are fully capable of running desktop (GUI) applications in a sandbox. The key to this use-case is the X server running on the host operating system. All we have to do is to run a container as a client to the host's X server to display its GUI. This requires two additional parameters with `docker run`:

1. Host shell's display env var: `-e DISPLAY=$DISPLAY` ( `-e DISPLAY` also works)
2. Host machine's X server socket mounted as a volume in the container: `-v /tmp/.X11-unix:/tmp/.X11-unix:ro`

## Build & Run

To build an image from the project root, run command like

```sh
docker build -t IMAGE_NAME[:TAG] ./CONTEXT_DIR
```

For a Firefox image

```sh
docker build -t firefox-box:0.1 ./firefox
```

In order to allow requests from non-network local connections to the host's X server

```sh
xhost + local:root
```

Finally, we can run a container from this image

```sh
docker run --rm -it --name firefox -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro firefox-box:0.1
```

There are a couple of convenience scripts for this this purpose at the project root that can be used as

```sh
./build.sh firefox-box:0.1 ./firefox
./run.sh firefox-box:0.1
```

## Docker-Compose

There are also `docker-compose.yml` provided for each sub-repository that are automated via `compose.sh` script. Use these scripts from project root as

```sh
./firefox/compose.sh
```

## Docker Hub

If you just want to test the image without dirtying your hands, pull the Firefox image hosted at the docker hub and give it a spin.

## References

1. Lei Mao's [log book](https://leimao.github.io/blog/Docker-Container-GUI-Display/).
2. [linuxmeerkat](https://linuxmeerkat.wordpress.com/2014/10/17/running-a-gui-application-in-a-docker-container/) blog.

