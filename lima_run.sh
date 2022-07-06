#!/usr/bin/env bash
# somehow cant use -rm and -d in the same command
# so stop and delete is done manually

CODE=${HOME}/code
lima nerdctl stop ansible-development
lima nerdctl rm ansible-development
lima nerdctl run --detach --name ansible-development \
  -v ${CODE}:/home/${USER}/code \
  -v ${HOME}/.ssh:/home/${USER}/.ssh \
  --user $UID:$UID \
  ansible-development:latest
