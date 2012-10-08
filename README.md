Ubuntu-Development-Machine
==========================
This package uses a bash script and [Opscode Chef](http://wiki.opscode.com/display/chef/Home) to install software on a (preferably fresh) Ubuntu 12.04 development machine. Chef installs all pacages with the exception of Ruby, RVM, and their dependencies. Ruby is installed via bash so that Chef can run, and RVM is installed via bash so that it is not installed as root.

Instaling the Installer
-----------------------
If you have not already done so, install git locally and pull down this project
1. sudo apt-get install git-core -y
2. git clone https://github.com/dvizzini/ubuntu-development-machine.git chef

Configuring the Installer
-------------------------
Please modify the user config in developer-setup.json before you kick off the installer
1. modify full_name and email_address to be what you want in the .gitconfig file that will be put in your home directory
2. modify the username listed and home to match the user you plan to install with
3. modify the base_packages to to install what you would like to install. They take the same package names as apt-get

Run the Installer
-----------------
To run the chef script and setup your linux development machine:
	sudo ./install.sh developer-setup.json
