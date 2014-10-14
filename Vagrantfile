# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'

def local_cache(basebox_name)
  cache_dir = Vagrant::Environment.new.home_path.join('cache', 'apt', basebox_name)
  partial_dir = cache_dir.join('partial')
  FileUtils.mkpath partial_dir unless partial_dir.exist?
  cache_dir
end

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder local_cache(config.vm.box), "/var/cache/apt/archives/"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1280
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "getreqs.yml"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "prep.yml"
    ansible.extra_vars = {
      mariadb_bind_address: "0.0.0.0"
      neutron_controller_dockerized_deployment: true
    }
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deploy.yml"
    ansible.extra_vars = {
      neutron_controller_dockerized_deployment: true
    }
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "test.yml"
  end

end
