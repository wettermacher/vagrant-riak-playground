# Ansible Roles for Riak Playground

## Project Components
* Vagrant: For Dev Environment only. Auto creates required virtualbox hosts.
* Ansible: Provisioning and utilities for riak. Can be used with vagrant, other virtual hosts and bare metal.

## Run on dev hosts
* Checkout from git
* cd projectbase
* vagrant up ansible riak1 riak2 riak3
* vagrant ssh
* ... will login to ansible box because this box is defined as default in Vagrantfile
* See install riak section below to install and configure riak on all nodes

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

## Backup Riak Data
```
cd /vagrant/ansible
ansible-playbook -i hosts/vagrant riak-backup-nodes.yml
```

This will...
* Create snapshot node by node
* rsync snapshot data to target folder
* Remove snapshot

## Add Nodes
* Add node in inventory file (ansible/hosts/..)
* (Re-) run setup-riak.yml playbook

