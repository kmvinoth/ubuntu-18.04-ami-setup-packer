#!/bin/bash -eux

apt-get update

apt-get -y upgrade

# ensure the correct kernel headers are installed
apt-get -y install linux-headers-$(uname -r)
# fix broken dependencies
apt-get -y -f install
# update package index on boot
cat <<EOF > /etc/init/refresh-apt.conf
description "update package index"
start on networking
task
exec /usr/bin/apt-get update
EOF

# install curl to fix broken wget while retrieving content from secured sites
apt-get -y install curl

# install general purpose packages
# install rsync
apt-get -y install rsync

# install screen
apt-get -y install screen

# install git
echo "Installing git"
apt-get -y install git

# install pip3
echo "Installing pip3"
apt-get -y install python3-pip
echo "Upgrading python3 pip"
pip3 install --upgrade pip

echo "Print (python3) pip version"
pip --version

echo "Installing cookiecutter"
pip install --user cookiecutter

echo "Add cookiecutter to path"
export PATH=$HOME/.local/bin:$PATH
source .profile

echo "Print cookiecutter version"
cookiecutter --version

# sshd config
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

# sudoers config
# Only add the secure path line if it is not already present - Debian 7
# includes it by default.
grep -q 'secure_path' /etc/sudoers || sed -i -e '/Defaults\s\+env_reset/a Defaults\tsecure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' /etc/sudoers


