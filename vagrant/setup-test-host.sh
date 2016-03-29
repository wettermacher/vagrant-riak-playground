 # this is the user ansible will use to access this test host
 adduser --disabled-password --gecos "" ansible
 
 # disable prompt for sudo password
 /bin/grep -q -F 'include "ansible ALL=NOPASSWD: ALL"' /etc/sudoers || /bin/echo "ansible ALL=NOPASSWD: ALL" >> /etc/sudoers
 
 # copy public key for ansible user
 mkdir -p /home/ansible/.ssh
 cat /vagrant/vagrant/files/ssh/id_rsa.pub >> /home/ansible/.ssh/authorized_keys
 