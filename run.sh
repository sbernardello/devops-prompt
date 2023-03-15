#!/usr/bin/env bash

WORKSPACE="$(pwd)"
LOCAL_CONFIG_FOLDER="/Users/sbernardello/.devops-tools"
MOUNT_POINT="/workspace"
COMMAND="$*"

mkdir -p "$LOCAL_CONFIG_FOLDER"

docker run -it --rm \
    -v "$WORKSPACE":"$MOUNT_POINT" \
    -v "$LOCAL_CONFIG_FOLDER/.kube":"/home/devops/.kube" \
    --env AWS_REGION="$AWS_REGION" \
    --env AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
    --env AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
    --env AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN" \
    devops-tools bash -c "$COMMAND"