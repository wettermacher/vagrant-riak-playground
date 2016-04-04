# Ansible Roles for Riak Playground

## Install Dependencies from Ansible Galaxy
```
// in ansible folder
sudo ansible-galaxy install -r dependencies.yml
```
This will download roles from ansible galaxy and install globally (see: /etc/ansible).

## Install Riak
```
cd /vagrant/ansible
ansible-playbook -i hosts/vagrant setup-riak.yml
```

This will...
* Create lvm using devices defined in hosts
* Install riak
* Setup cluster

## Backup
```
cd /vagrant/ansible
ansible-playbook -i hosts/vagrant riak-backup-nodes.yml
```

This will...
* Create snapshot node by node
* rsync snapshot data to target folder
* Remove snapshot

