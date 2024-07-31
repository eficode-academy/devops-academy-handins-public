#!/usr/bin/env bash

EXERCISE_PATH=$(dirname $(realpath "$0"))
#make sure that you are working with the latest version of the checker
docker pull eficodeacademy/devops-academy-checker:release

docker run \
    --rm \
    -it \
    -v "$EXERCISE_PATH":/exercise \
    eficodeacademy/devops-academy-checker:release \
    git $*
