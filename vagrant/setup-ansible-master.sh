﻿
apt-add-repository -y ppa:ansible/ansible
apt-get -q update

apt-get -y install git-core software-properties-common ansible

# access to vagrant test hosts
cp /vagrant/vagrant/files/ssh/id_rsa /home/vagrant/.ssh/id_rsa

# provision with ansible
cd /vagrant/ansible
ansible-galaxy install -r /vagrant/ansible/dependencies.yml
# ansible-playbook -i /vagrant/ansible/hosts/localhost -c local ansible/ansible-master-host.yaml