#!/usr/bin/env bash

EXERCISE_PATH=$(dirname $(realpath "$0"))

docker run \
    --rm \
    -it \
    -v "$EXERCISE_PATH":/exercise \
    eficodeacademy/devops-academy-checker:release \
    git $*
