#!/bin/sh -eux
 
echo "Installing Docker"

sudo apt-get remove docker docker-engine
 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y docker-ce
 
sudo groupadd docker
sudo usermod -aG docker ubuntu
 
sudo systemctl enable docker

docker version

echo "Docker installation completed successfully !"

echo "Installing docker-compose"

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo curl -L https://raw.githubusercontent.com/docker/compose/1.26.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

docker-compose --version

echo "docker-compose installation completed successfully !"
