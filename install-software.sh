#!/bin/bash 
set -eu

sudo apt -y update 
sudo apt install -y tree 

function installDocker() {
  echo "Installing Docker CE..."
  curl -fsSL get.docker.com -o /usr/local/src/get-docker.sh
  sudo sh /usr/local/src/get-docker.sh
  sudo usermod -aG docker vagrant
}

installDocker
