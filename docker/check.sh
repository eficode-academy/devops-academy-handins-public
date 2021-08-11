#!/usr/bin/env bash

EXERCISE_PATH=$(dirname $(realpath "$0"))

docker run \
  --rm \
  -it \
  --network host \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$EXERCISE_PATH":/exercise \
  eficodeacademy/devops-academy-checker:release-2 \
  docker $*
