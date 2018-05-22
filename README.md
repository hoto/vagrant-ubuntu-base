# Vagrant Ubuntu 18.04 LTS base

Install vagrant https://www.vagrantup.com/downloads.html

Spin up the machine (user/pass: vagrant/vagrant):

    vagrant up

SSH into the machine:

    vagrant ssh
    
Test if docker works (you may need to enable virualization in BIOS):

    docker run hello-world

This project directory is shared on the guest machine in:

    ls /vagrant

On any problems with provisioning run:

    vagrant provision --provision-with "install-software"

Reboot with:

    vagrant reload

Remove the machine from system:

    vagrant destroy
