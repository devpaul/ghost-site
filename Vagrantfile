# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "192.168.10.10"

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "site.pp"
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
  end
end
