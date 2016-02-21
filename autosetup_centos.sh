#!/bin/bash

# Check if we're root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Bring the system up to date
yum update -y

# Install git
yum install git -y

# Install Docker
curl -sSL https://get.docker.com/ | sh
chkconfig docker on
service docker start

# Install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Clone this repo and start up the environment
git clone https://github.com/TheMonkeyz/typo37-php7.git
cd typo37-php7
/usr/local/bin/docker-compose up
