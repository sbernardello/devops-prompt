#!/usr/bin/env bash

docker buildx build -f Dockerfile -t devops-tools --platform linux/amd64 . --load
