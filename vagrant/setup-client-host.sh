
apt-add-repository -y ppa:ansible/ansible
apt-get -q update

apt-get -y install git-core

# access to vagrant test hosts
cp /vagrant/vagrant/files/ssh/id_rsa /home/vagrant/.ssh/id_rsa
