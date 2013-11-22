Ubuntu-Development-Machine
==========================
This package uses a bash script and [Opscode Chef](http://wiki.opscode.com/display/chef/Home) to provision a Ubuntu/Xubuntu 13.04 or Mint 15 developer machine

Before you can run the installer
-----------------------
If you have not already done so, install git locally and pull down this project

1. sudo apt-get install git-core -y
2. git clone https://github.com/toranb/ubuntu-development-machine.git chef

Configuring the installer
-------------------------
Please modify the user config in ubuntu.json before you kick off the installer

1. modify full_name and email_address to be what you want in the .gitconfig file that will be put in your home directory
2. modify the username listed and home to match the user you plan to install with
3. modify the base_packages to to install what you would like to install. They take the same package names as apt-get

Run the installer
-----------------
To setup your ubuntu/xubuntu development machine

	sudo ./install.sh ubuntu.json

To setup your mint development machine

	sudo ./install.sh mint.json

After the installer is complete run the script below to setup vim and your dotfiles

  cd ~/imt_dotfiles/Linux/ && bash symlink.sh

After this is complete open vim and do the following

  :BundleInstall

optional zsh configuration
-----------------
If you prefer zsh instead of bash, run the command below and reboot

	chsh -s /bin/zsh

What your development machine looks like after the installer
-----------------
This installer is built on a great deal of opinions so it's good to know what is on your machine after it completes

    The most current stable build of google-chrome (only for mint configuration)
	The most current stable build of rvm
    The most current stable build of node.js + npm
    A stable version of phantomjs 1.8.1
    Ruby 1.9.3 ships with Ubuntu/Xubuntu 13.04
    Python 2.7.4 ships with Ubuntu/Xubuntu 13.04
    The most current pip + virtualenv + virtualenvwrapper
    The most current release of vim + my custom python and django vimrc/plugins
    A custom oh-my-zsh configuration (optional)
    A custom bash configuration
    A custom tmux configuration
    A few other debian packages: openjdk-7, ack, nginx, mysql, postgresql, sqlite3
