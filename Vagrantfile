# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #config.vm.box = "ubuntu/trusty64"
  config.vm.box = "ubuntu/precise64"

  config.vm.provider :virtualbox do |v|
    v.memory = 1024
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "getreqs.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "prepare-vm.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deploy.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "test.yml"
  end

end
