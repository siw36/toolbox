#!/usr/bin/env bash
docker build \
  --build-arg USER_ID=$UID \
  --build-arg USER_NAME=$USER \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg ANSIBLE_VERSION="2.11.2" \
  -t ansible-development:latest \
  .
