FROM debian

RUN apt update && \
    apt install -y curl unzip zip gpg sudo wget \
        build-essential procps curl file git \
        vim nano micro kubernetes-client

# Setup AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm awscliv2.zip

# Setup AWS-VAULT
RUN wget "https://github.com/99designs/aws-vault/releases/download/v7.1.0/aws-vault-linux-amd64" -O "aws-vault" && \
    chmod +x aws-vault && \
    sudo mv aws-vault /usr/local/bin

RUN wget "https://github.com/mozilla/sops/releases/download/v3.7.3/sops-v3.7.3.linux" -O "sops" && \
    chmod +x sops && \
    sudo mv sops /usr/local/bin/

RUN addgroup devops --gid 1000 && \
    adduser devops --gid 1000 --uid 1000 --disabled-password \
        --home /home/devops --gecos GECOS && \
        usermod -a -G sudo,adm devops && \
        echo "devops ALL=NOPASSWD: ALL" | sudo tee /etc/sudoers.d/devops


USER devops
WORKDIR /workspace

# For debug purpose only
#USER root
# RUN chown -R $CONTAINER_USER: /home/linuxbrew/.linuxbrew