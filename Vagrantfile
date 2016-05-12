# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "box-cutter/ubuntu1404-desktop"

  config.ssh.forward_agent = true

  # you can add this machine ip to your hosts file like this
  #
  # #C:\Windows\System32\drivers\etc\hosts :
  # 192.168.50.4 vagrant
  #
  # then access any guest (ubuntu) port from your host machine (windows) browser (chrome) using:
  # vagrant:5050
  config.vm.network "private_network", ip: "192.168.50.4"

  # this ports will be attached to localhost (if they are available)
  #config.vm.network "forwarded_port", guest: 80, host: 80
  #config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4000"
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.gui = true
    vb.customize ["modifyvm", :id, "--monitorcount", "1"]
  end

  #you can share yor projects folder with the guest machine 
  #config.vm.synced_folder "c:/projects", "/home/vagrant/projects", owner: "vagrant", group: "vagrant"

  #this will copy your ssh keys to guest machine so you can push and pull from eg. gitlab
  config.vm.provision "copy-ssh-keys", type: "file", source: "~/.ssh", destination: "."

  # install software on the guest (ubuntu) machine, this can take a long time (couple of minutes)
  # provisioning is only done once on the initial `vagrant up`, to rerun provisioning:
  # vagrant reload
  #config.vm.provision "install-software", type: "shell", path: "install-software.sh", privileged: true
end
