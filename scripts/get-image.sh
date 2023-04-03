#!/usr/bin/bash

IMAGE_SOURCE_TYPE=$1
IMAGE_SOURCE=$2

if [ $IMAGE_SOURCE_TYPE == 'url' ]; then
    wget -q --no-verbose $IMAGE_SOURCE -O images.tar.xz;
elif [ $IMAGE_SOURCE_TYPE == 'path' ]; then
    cp -up $IMAGE_SOURCE ./images.tar.xz
else
    echo "Image source type not supported"
    exit 1
fi



