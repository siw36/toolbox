#!/usr/bin/env bash
CODE=${HOME}/code
for i in {1..6}; do
  docker run --rm --name toolbox-$i -d \
    -v ${CODE}:/home/${USER}/code \
    -v ${HOME}/.ssh:/home/${USER}/.ssh \
    -v ${HOME}/.kube:/home/${USER}/.kube \
    --user $UID:$UID \
    toolbox:latest
done
