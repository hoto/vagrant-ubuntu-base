# Vagrant Ubuntu 18.04 LTS base

Install vagrant https://www.vagrantup.com/downloads.html

Spin up the machine (user/pass: vagrant/vagrant):

    vagrant up

This project directory is shared on the guest machine in:

    /vagrant

On any problems with provisioning run:

    vagrant provision

Or reboot the machine and rerun provisioning with:

    vagrant reload

Remove the machine from system:

    vagrant destroy

