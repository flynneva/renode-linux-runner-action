#!/bin/bash

IMAGE_PATH=renode-linux-runner-docker
DOCKERFILE_PATH=$IMAGE_PATH/Dockerfile
SHARED_DIR="$(python3 extract_arguments.py shared-dir)"

mkdir $IMAGE_PATH/tests
cp -r -f tests/* $IMAGE_PATH/tests/

docker build -t $IMAGE_PATH      \
             -f $DOCKERFILE_PATH \
              $IMAGE_PATH &&     \
docker run --privileged                                    \
           -v "$(pwd)"/$IMAGE_PATH/$SHARED_DIR:/mnt/user   \
           $IMAGE_PATH                                     \
           "$(python3 extract_arguments.py renode-run)"    \
           "$(python3 extract_arguments.py devices)"

yes | rm -r -f $IMAGE_PATH/tests
