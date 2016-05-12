# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "box-cutter/ubuntu1404-desktop"

  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "192.168.50.4"
 #config.vm.network "forwarded_port", guest: 80, host: 80
 #config.vm.network "forwarded_port", guest: 3000, host: 3000
 #config.vm.network "forwarded_port", guest: 3030, host: 3030
 #config.vm.network "forwarded_port", guest: 5000, host: 5000
 #config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4000"
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.gui = true
    vb.customize ["modifyvm", :id, "--monitorcount", "1"]
  end


  config.vm.provision "copy-ssh-keys", type: "file", source: "~/.ssh", destination: "."

  $deployment = "deployment"
  $install = $deployment + "/install"

  config.vm.provision "install-pip", type: "shell", path: $install + "/install-pip.sh", privileged: true
  config.vm.provision "install-git", type: "shell", path: $install + "/install-git.sh", privileged: true
  config.vm.provision "install-nodejs", type: "shell", path: $install + "/install-nodejs.sh", privileged: true
  config.vm.provision "install-docker", type: "shell", path: $install + "/install-docker.sh", privileged: true
  config.vm.provision "install-docker-compose", type: "shell", path: $install + "/install-docker-compose.sh", privileged: true
  config.vm.provision "install-aws-cli", type: "shell", path: $install + "/install-aws-cli.sh", privileged: true
  config.vm.provision "install-vim", type: "shell", path: $install + "/install-vim.sh", privileged: true
  config.vm.provision "install-jq", type: "shell", path: $install + "/install-jq.sh", privileged: true


  config.vm.provision "shell", inline: <<-SHELL
    # you can write any bash commands here, install software or do configuration
    sudo apt-get update
    sudo apt-get install tree -y
  SHELL

end
