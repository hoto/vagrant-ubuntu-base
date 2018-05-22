#!/bin/bash 
set -eu

sudo apt -y update 
sudo apt install -y tree 

function installDocker() {
  if ! [ -x "$(command -v docker)" ]; then
    echo "Installing Docker CE..."
    curl -fsSL get.docker.com -o /usr/local/src/get-docker.sh
    sudo sh /usr/local/src/get-docker.sh
    sudo usermod -aG docker vagrant
  fi
}

function installDockerCompose() {
  echo "Installing Docker Compose..."
  sudo curl \
    -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) \
    -o /usr/local/bin/docker-compose
}

installDocker
installDockerCompose
