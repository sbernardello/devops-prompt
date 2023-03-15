@echo off
set WORKSPACE=%CD%
set LOCAL_CONFIG_FOLDER="%homedrive%%homepath%/devops-tools"
set WORKSPACE_MOUNT_POINT="/workspace"
set REMOTE_HOME_FOLDER="/home/devops/"
set COMMAND=%*

docker run --name devops-tools ^
    -it --rm ^
    -v "%WORKSPACE%":"%WORKSPACE_MOUNT_POINT%" ^
    -v "%LOCAL_CONFIG_FOLDER%/.kube":"%REMOTE_HOME_FOLDER%/.kube" ^
    -v "%LOCAL_CONFIG_FOLDER%/.awsvault":"/home/devops/.awsvault" ^
    -v "%LOCAL_CONFIG_FOLDER%/.aws":"/home/devops/.aws" ^
    -e AWS_VAULT_BACKEND=file ^
    devops-tools bash -c "%COMMAND%"
