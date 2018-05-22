# Vagrant Ubuntu 18.04 LTS base

Install vagrant https://www.vagrantup.com/downloads.html

Start the machine (user/pass: vagrant/vagrant):

    vagrant up

SSH into the machine:

    vagrant ssh
    
Test if docker works on the guest machine:

    docker info
    docker run hello-world

Test port binding and forwarding:

    docker run -d -p 3000:80 -p 4000:80 nginx

Now test those urls from guest and host machine:
    
    localhost:3000
    localhost:4000
    http://192.168.50.4:3000 
    http://192.168.50.4:4000

This project directory is synced on the guest machine in:

    ls /vagrant

On any problems with provisioning run:

    vagrant provision --provision-with "install-software"

Reboot machine with:

    vagrant reload

Remove the machine from system:

    vagrant destroy

