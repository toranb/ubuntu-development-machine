#!/bin/sh
# A simple Script for installing Rails on Ubuntu 12.04 LTS
# It will also install the dependencies required as well as the RVM
# Author: Ramesh Jha (rameshjha420@gmail.com),(http://blog.sudobits.com)
# License: MIT 

RUBY_VERSION="1.9.3"
LOG_FILE="./install.log"
echo "Installer started"

# Installing Dependencies
echo ".............Updating package cache..........."
sudo apt-get update -o Acquire::http::No-Cache=True >$LOG_FILE

echo "............Preparing RVM Install............."
sudo apt-get -y install build-essential curl zlib1g-dev libreadline-dev libssl-dev libxml2-dev openssl libyaml-dev libopenssl-ruby1.9.1 ruby1.9.1 rubygems1.9.1 ruby1.9.1-dev >>$LOG_FILE
export PATH=$PATH:/var/lib/gems/1.9.1/bin:/usr/lib/ruby/1.9.1/

# Install RVM (Ruby Version Manager)
echo "................Installing RVM................."
$LOG_FILE<< bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer

echo "..................Loading RVM...................."
source ~/.rvm/scripts/rvm >>$LOG_FILE

# Exiting sudo mode

# Install Ruby v 1.8.7
echo ".............Installing Ruby v 1.8.7............."
rvm install 1.8.7 >>$LOG_FILE

# Install Latest version of Ruby
echo ".............Installing Ruby v $RUBY_VERSION............."
rvm install $RUBY_VERSION >>$LOG_FILE

echo "........Setting the default version of Ruby......."
rvm --default use $RUBY_VERSION >>$LOG_FILE

echo "................Installing Chef..................."
gem install ruby-shadow chef --no-rdoc --no-ri >>$LOG_FILE

# Back into sudo

echo "...............Following Recipes.................."
`which chef-solo` --config solo.rb --json-attributes $json >>$LOG_FILE

sudo reboot now
