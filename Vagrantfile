# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "ansible", primary: true do |main|
    main.vm.box = "ubuntu/trusty64"
    main.vm.network "private_network", ip: "192.168.50.10"
    
    main.vm.provider "virtualbox" do |vb|
      vb.memory = 3072
      vb.cpus = 1
    end
    
    main.vm.provision "shell", path: "vagrant/setup-ansible-master.sh"
  end

  # setup test riak nodes  
  (1..3).each do |i|
    config.vm.define "riak-#{i}" do |node|
      node.vm.box = "ubuntu/trusty64"
      node.vm.network "private_network", ip: "192.168.50.1#{i}"
      node.vm.provision "shell", path: "vagrant/setup-test-host.sh"
    end
  end
  
end
