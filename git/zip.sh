#!/usr/bin/env bash

DIRECTORY_NAME="$(basename "$(pwd)")"
HANDIN="git"

if [ ! $(command -v zip) ]; then
    echo "zip is not installed, installing ..."
    sudo apt-get update
    sudo apt-get intall -y zip
else
    echo "zip is installed"
fi

if [ "$DIRECTORY_NAME" = "$HANDIN" ]; then
    STUDENT=$(cat student.txt)
    ZIP_FILE="$HANDIN-$STUDENT.zip"
    ZIP_DIR="$HANDIN-$STUDENT"
    mkdir $ZIP_DIR
    cp -rv student.txt "$ZIP_DIR"
    cp -rv exercise* "$ZIP_DIR"
    [ -f "$ZIP_FILE" ] && rm -v "$ZIP_FILE"
    zip -r "$ZIP_FILE" "$ZIP_DIR"
    rm -rfv "$ZIP_DIR"
else
    echo "Must be run inside '$HANDIN' directory."
    exit 1
fi
