# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"

  config.ssh.forward_agent = true

  # you can add this ip as an alias to your hosts file like this:
  #
  # #C:\Windows\System32\drivers\etc\hosts :
  # 192.168.50.4 vagrant
  #
  # then access any guest port from your host machine using: `vagrant:<port>`
  # or don't edit the hosts file and use: `192.168.50.4:<port>`
  config.vm.network "private_network", ip: "192.168.50.4"

  # this ports will be forawded permanently from the guest machine to the host machine
  # very usefull if you want to open something runnin on the guest machine in your host machine browser
  #config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6000"
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  # you can share any folders with the guest machine 
  # config.vm.synced_folder "c:/projects", "/home/vagrant/projects", owner: "vagrant", group: "vagrant"

  # this will copy your ssh keys to guest machine, those folders are not synchronized
  config.vm.provision "copy-ssh-keys", type: "file", source: "~/.ssh", destination: "/home/vagrant/.ssh"
  config.vm.provision "copy-aws-configs", type: "file", source: "~/.aws", destination: "/home/vagrant/.aws"

  # execute script on the guest machine, eg install software 
  # provisioning is only done once on the initial `vagrant up`
  # to restart machine and rerun provisioning: `vagrant reload`
  config.vm.provision "install-software", type: "shell", path: "install-software.sh", privileged: true
end
