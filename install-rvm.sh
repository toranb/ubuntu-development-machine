#!/bin/sh
# A simple Script for installing Rails on Ubuntu 12.04 LTS
# It will also install the dependencies required as well as the RVM
# Author: Ramesh Jha (rameshjha420@gmail.com),(http://blog.sudobits.com)
# License: MIT 

RUBY_VERSION="1.9.3"
LOG_FILE="./install.log"

echo "Rails Installer started"

# Installing Dependencies
echo ".......Updating package cache....."
sudo apt-get update >>$LOG_FILE
echo "......Done.........."

echo "..........Installing git.........."
sudo apt-get -y install git >>$LOG_FILE
echo "..........Done...................."

echo "Installing Curl"
sudo apt-get -y install curl >>$LOG_FILE
echo "...........Done..................."

# Install RVM (Ruby Version Manager)
echo ".....Installing RVM.............."
curl -L get.rvm.io | bash -s stable >>$LOG_FILE

# fallback for the above command (in case of certificates errors)
#if ($? !=0)
# then
#  curl -kL get.rvm.io | bash -s stable
#fi  

echo "............DONE.........."
echo "......Loading RVM.........."
source ~/.rvm/scripts/rvm >>$LOG_FILE
echo "...........Done..........."

# Install Additional Dependencies (Removed nodejs from list to avoid cookbook conflicts. Kept everything else although I doubt I will use many tools. -DV)

sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

# Install Latest version of Ruby
echo "........Installing Ruby v 1.8.7 ..."
rvm install 1.8.7 >>$LOG_FILE
echo "==> Done........."

# Install Latest version of Ruby
echo "........Installing Ruby v $RUBY_VERSION ..."
rvm install $RUBY_VERSION >>$LOG_FILE
echo "==> Done........."

# Select and Set latest version of ruby as the default so that
# You won't have to select each time you start a terminal

echo ".......Setting the default version of Ruby..."
rvm --default use $RUBY_VERSION >>$LOG_FILE
echo "==> Done........."

echo "Now, You are using Ruby $RUBY_VERSION by default"
echo "if you want to change that then use 'rvm --default <ruby_version>' "

echo "######################################"
echo "###### Installation Completed ########"
echo "######################################"

echo "if something went wrong then checkout the log file $LOG_FILE"
