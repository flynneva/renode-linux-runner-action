#!/usr/bin/bash

IMAGE="$1"

if [ -f "$IMAGE" ]; then
    if [ $(basename "$IMAGE") == "images.tar.xz" ] && [ -f "./images.tar.xz" ] && [ "$(diff "$IMAGE" ./images.tar.xz)" == "" ]; then
        echo File already exists
    else
        cp "$IMAGE" ./images.tar.xz
    fi
else
    wget -q --no-verbose "$IMAGE" -O ./images.tar.xz;
fi
