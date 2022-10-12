#!/usr/bin/env bash
CODE=${HOME}/code
docker stop toolbox
docker rm toolbox
docker run --rm --name toolbox -d \
  -v ${CODE}:/home/${USER}/code \
  -v ${HOME}/.ssh:/home/${USER}/.ssh \
  --user $UID:$UID \
  toolbox:latest
