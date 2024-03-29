#!/usr/bin/env bash
docker build \
  --build-arg USER_ID=$UID \
  --build-arg USER_NAME=$USER \
  --build-arg ARCHITECTURE=$(uname -m) \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  -t toolbox:latest \
  .

# --no-cache \
