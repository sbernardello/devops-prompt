#!/usr/bin/env bash

WORKSPACE="$(pwd)"
LOCAL_CONFIG_FOLDER="$HOME/.devops-tools"
WORKSPACE_MOUNT_POINT="/workspace"
REMOTE_HOME_FOLDER="/home/devops/"
COMMAND="$*"

mkdir -p "$LOCAL_CONFIG_FOLDER"
chmod 700 "$LOCAL_CONFIG_FOLDER"

## This is the initial version that require aws-vault env set to run aws commands
#docker run --name devops-tools \
#    -it --rm \
#    -v "$WORKSPACE":"$WORKSPACE_MOUNT_POINT" \
#    -v "$LOCAL_CONFIG_FOLDER/.kube":"$REMOTE_HOME_FOLDER/.kube" \
#    -v "$LOCAL_CONFIG_FOLDER/.awsvault":"/home/devops/.awsvault" \
#    -e AWS_REGION="$AWS_REGION" \
#    -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
#    -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
#    -e AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN" \
#    -e AWS_VAULT_BACKEND="file" \
#    devops-tools bash -c "$COMMAND"

docker run --name devops-tools \
    -it --rm \
    -v "$WORKSPACE":"$WORKSPACE_MOUNT_POINT" \
    -v "$LOCAL_CONFIG_FOLDER/.kube":"$REMOTE_HOME_FOLDER/.kube" \
    -v "$LOCAL_CONFIG_FOLDER/.awsvault":"/home/devops/.awsvault" \
    -v "$LOCAL_CONFIG_FOLDER/.aws":"/home/devops/.aws" \
    -e AWS_REGION="$AWS_REGION" \
    -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
    -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
    -e AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN" \
    -e AWS_VAULT_BACKEND="file" \
    devops-tools bash -c "$COMMAND"