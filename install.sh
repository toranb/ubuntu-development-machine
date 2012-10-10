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
gem install ruby-shadow chef --no-rdoc --no-ri >>$LOG_FILE

# Back into sudo

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
