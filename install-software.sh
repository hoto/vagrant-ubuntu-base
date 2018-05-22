#!/bin/bash 
set -eu

# executed as root

sudo apt-get -y update 
sudo apt-get install -y tree python3-pip

function installDocker() {
  if ! [ -x "$(command -v docker)" ]; then
    echo "Installing Docker CE..."
    curl -fsSL get.docker.com -o /usr/local/src/get-docker.sh
    sudo sh /usr/local/src/get-docker.sh
    sudo usermod -aG docker vagrant
  fi
}

function installDockerCompose() {
  if ! [ -x "$(command -v docker-compose)" ]; then
    echo "Installing Docker Compose..."
    sudo curl \
      -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) \
      -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  fi
}

function installAwsCli() {
  if ! [ -x "$(command -v aws)" ]; then
    echo "Installing aws cli..."
    sudo -H -u vagrant bash -c 'pip3 install awscli'
    sudo -H -u vagrant bash -c 'pip3 install aws-shell'
  fi
}

function installAnsible() {
  if ! [ -x "$(command -v ansible)" ]; then
    echo "Instaling Ansible..."
    sudo apt-get -y update
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get -y update
    sudo apt-get install -y ansible
  fi
}

installDocker
installDockerCompose
installAwsCli
installAnsible
