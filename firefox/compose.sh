#!/usr/bin/env sh

xhost + local:root
sudo docker-compose up
sudo docker-compose down
xhost - local:root
