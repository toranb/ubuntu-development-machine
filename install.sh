#!/bin/bash

# A simple Script for installing Rails on Ubuntu 12.04 LTS
# It will also install the dependencies required as well as the RVM
# Author: Ramesh Jha (rameshjha420@gmail.com),(http://blog.sudobits.com)
# License: MIT 

RUBY_VERSION="1.9.3"
LOG_FILE="./install.log"

# check arguments
json="${1}"

if [ -z "$json" ]; then
    echo "Usage: ./install.sh [json]"
    exit
fi

echo "............Updating package cache............"
sudo apt-get update -o Acquire::http::No-Cache=True >$LOG_FILE

echo ".......Installing Ruby and dependencies......."
sudo apt-get -y --force-yes install build-essential curl zlib1g-dev libreadline-dev libssl-dev libxml2-dev openssl libyaml-dev libopenssl-ruby1.9.1 ruby1.9.1 rubygems1.9.1 ruby1.9.1-dev >>$LOG_FILE

echo "...............Installing Chef................"
gem install moneta --version=0.6.0 >>$LOG_FILE
gem install net-ssh -v 2.2.2 --no-ri --no-rdoc >>$LOG_FILE
gem install net-ssh-gateway -v 1.1.0 --no-ri --no-rdoc --ignore-dependencies >>$LOG_FILE
gem install net-ssh-multi -v 1.1.0 --no-ri --no-rdoc --ignore-dependencies >>$LOG_FILE
gem install ruby-shadow --no-rdoc --no-ri >>$LOG_FILE
gem install chef --version=10.16.2 --no-rdoc --no-ri >>$LOG_FILE

echo ".............Following Recipes................"
`which chef-solo` --config solo.rb --json-attributes $json >>$LOG_FILE

while true; do
    read -p "Reboot recommended. Would you like to reboot now? [Y/n]" yn
    case $yn in
        [Y]* ) sudo reboot now;;
        [Nn]* ) exit;;
        * ) echo "Please answer Yes or no.";;
    esac
done
