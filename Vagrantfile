# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-17.04"
  config.vm.synced_folder "./", "/home/vagrant/rucc"
  config.vm.synced_folder "./thirdparty/ruby", "/home/vagrant/ruby"
end
