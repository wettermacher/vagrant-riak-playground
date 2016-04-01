
apt-add-repository -y ppa:ansible/ansible
apt-get -q update

apt-get -y install git-core software-properties-common ansible

# access to vagrant test hosts
cp /vagrant/vagrant/files/ssh/id_rsa /home/vagrant/.ssh/id_rsa

# access from ansible master hosts
# this is the user ansible will use to access this test host
adduser --disabled-password --gecos "" ansible
 
# disable prompt for sudo password
/bin/grep -q -F 'include "ansible ALL=NOPASSWD: ALL"' /etc/sudoers || /bin/echo "ansible ALL=NOPASSWD: ALL" >> /etc/sudoers
 
# copy public key for ansible user
mkdir -p /home/ansible/.ssh
cat /vagrant/vagrant/files/ssh/id_rsa.pub >> /home/ansible/.ssh/authorized_keys
 
# END access from ansible master host

cd /vagrant/ansible
ansible-playbook -i hosts/vagrant -c local setup-test-client.yml 