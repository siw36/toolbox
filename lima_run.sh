#!/usr/bin/env bash
# somehow cant use -rm and -d in the same command
# so stop and delete is done manually

CODE=${HOME}/code
lima nerdctl stop toolbox
lima nerdctl rm toolbox
lima nerdctl run --detach --name toolbox \
  -v ${CODE}:/home/${USER}/code \
  -v ${HOME}/.ssh:/home/${USER}/.ssh \
  --user $UID:$UID \
  toolbox:latest
