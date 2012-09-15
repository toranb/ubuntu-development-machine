#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

json="${1}"

if [ -z "$json" ]; then
    echo "Usage: ./install.sh [json]"
    exit
fi

if ! test -f "`which chef-solo`"; then
	apt-get update -o Acquire::http::No-Cache=True
	apt-get install -y curl git-core build-essential zlib1g-dev libssl-dev openssl
	gem install ruby-shadow chef --no-rdoc --no-ri
fi

`which chef-solo` --config solo.rb --json-attributes $json

#install rvm directly from script as non-root user
./install-rvm.sh
