#!/bin/sh
# A simple Script for installing Rails on Ubuntu 12.04 LTS
# It will also install the dependencies required as well as the RVM
# Author: Ramesh Jha (rameshjha420@gmail.com),(http://blog.sudobits.com)
# License: MIT 

RUBY_VERSION="1.9.3"
LOG_FILE="./install.log"
DONE=".....................Done......................"
echo "Installer started"

# Installing Dependencies
echo ".............Updating package cache..........."
sudo apt-get update -o Acquire::http::No-Cache=True >>$LOG_FILE
echo $DONE

echo "............Preparing RVM Install............."
sudo apt-get -y install curl build-essential zlib1g-dev libreadline-dev libssl-dev libxml2-dev >>$LOG_FILE
echo $DONE

# Install RVM (Ruby Version Manager)
echo ".................Installing RVM.................."
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer) >>$LOG_FILE
echo $DONE

echo "..................Loading RVM...................."
source ~/.rvm/scripts/rvm >>$LOG_FILE
echo $DONE

echo "..............Installing Eclipse................."
sudo apt-get install -y eclipse eclipse-jdt eclipse-pde eclipse-platform eclipse-rcp
#TODO: get Scala plugins via http://stackoverflow.com/questions/7163970/how-do-you-automate-the-installation-of-eclipse-plugins-with-command-line
echo $DONE

# Install Additional Dependencies
echo "..........Installing More Dependencies...."
sudo apt-get -y install git-core openssl libssl-dev libyaml-dev
echo $DONE

# Done with sudo mode

# Install Ruby v 1.8.7
echo ".............Installing Ruby v 1.8.7............."
rvm install 1.8.7 >>$LOG_FILE
echo $DONE

# Install Latest version of Ruby
echo ".............Installing Ruby v $RUBY_VERSION............."
rvm install $RUBY_VERSION >>$LOG_FILE
echo $DONE

# Select and Set latest version of ruby as the default so that
# You won't have to select each time you start a terminal

echo "........Setting the default version of Ruby......."
rvm --default use $RUBY_VERSION >>$LOG_FILE
echo $DONE

echo "You are now using Ruby $RUBY_VERSION by default."
echo "Use 'rvm --default <ruby_version>' to change this."

echo "................Installing Chef..................."
gem install ruby-shadow chef --no-rdoc --no-ri >>$LOG_FILE
echo $DONE

echo "...............Following Recipes.................."
`which chef-solo` --config solo.rb --json-attributes $json >>$LOG_FILE
echo $DONE

sudo reboot now
