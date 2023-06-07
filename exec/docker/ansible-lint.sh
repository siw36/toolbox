#!/usr/bin/env bash

# make ansible-vault from container available on native shell
# this will translate your MacOS home path to Linux home path
# note that the container only has access to the directory that is mounted inside it
# only relative path is supported
NATIVE_PATH=$(pwd)
CONTAINER_PATH=$(echo $NATIVE_PATH | sed 's/\/Users/\/home/g')
docker exec -w ${CONTAINER_PATH} -it toolbox ansible-lint $@