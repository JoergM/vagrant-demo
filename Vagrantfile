# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos64"

  config.vm.box_url = "https://dl.dropbox.com/u/25767365/boxes/centos64.box"

  config.vm.network :forwarded_port, guest: 27017, host: 27017

  config.vm.network :private_network, ip: "10.11.12.13"

  config.vm.synced_folder "./data", "/var/data", :create => true, :extra => 'dmode=777,fmode=777'

  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
	
	
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "centos64.pp"
  end
end
