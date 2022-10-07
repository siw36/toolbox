#!/usr/bin/env bash
lima nerdctl build \
  --build-arg USER_ID=$UID \
  --build-arg USER_NAME=$USER \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  -t toolbox:latest \
  --no-cache \
  .
