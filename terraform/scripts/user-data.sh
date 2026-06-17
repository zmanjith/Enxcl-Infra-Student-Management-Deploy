#!/bin/bash


exec > >(tee /var/log/user-data.log)  # Redirect stdout to a log file
exec 2>&1 # Redirect stderr to the same log file

echo "Starting bootstrap..."

apt-get update -y

apt-get install -y \
    docker.io \
    curl \
    unzip

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

mkdir -p /usr/local/lib/docker/cli-plugins

curl -SL \
https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
-o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

docker --version

docker compose version

echo "Bootstrap completed."