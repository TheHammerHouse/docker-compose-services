#!/bin/bash

ARCH=$(uname -m)

FILENAME=""

if [ "$ARCH" == "x86_64" ]; then
    FILENAME="docker-compose_intel.yml"
elif [ "$ARCH" == "arm64" ]; then
    FILENAME="docker-compose_arm.yml"
else
    echo "We are unable to build the containers for the following architecture: $ARCH"
    exit 1
fi

if ! docker info > /dev/null 2>&1; then
  echo "Docker is not running"
  exit 1
fi


docker-compose -f $FILENAME down
docker-compose -f $FILENAME up -d --build --force-recreate