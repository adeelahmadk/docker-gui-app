#!/usr/bin/env sh

[ "$#" -eq 1 -a "$1" = "-h" -o "$#" -ne 2 ] && echo "usage: ./"$(basename $0)" <IMAGE_NAME[:tag]> <CONTEXT_DIR>"; exit 0;

docker build -t "$1" ./"$2"
