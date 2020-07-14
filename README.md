Instructions for ubuntu-18.04-ami-setup-packer
==============================================

The goal of the repository is to spin up Ubuntu (18.04) server with Docker and Docker-compose, locally and in the cloud (AWS) using Packer and Vagrant with minimal effort. 


Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the "works on my machine" excuse a relic of the past.


## Setting up your local machine

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install [Vagrant](https://www.vagrantup.com/downloads.html)
* Install [Packer](https://www.packer.io/downloads.html)


## Building a box with Packer (local)

* Run `cd packer-templates`
* Run `packer build -only=virtualbox-iso ubuntu-18.04-server.json`

## Spining up the server with Vagrant (local)
* Run `cd vagrant_vm`
* Run `vagrant box add ubuntu-18.04.4-server-amd64.box --name dev-server`
* Run `vagrant up`
* Run `vagrant ssh` to connect to the server


## Spinning up the server and creating AMI on AWS

* Run `packer build -only=amazon-ebs ubuntu-18.04-server.json`

