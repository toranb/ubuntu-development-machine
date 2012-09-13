#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

json="${1}"

if [ -z "$json" ]; then
    echo "Usage: ./install.sh [json]"
    exit
fi

export PATH=$PATH:/var/lib/gems/1.9.1/bin:/usr/lib/ruby/1.9.1/

if ! test -f "`which chef-solo`"; then
	apt-get update -o Acquire::http::No-Cache=True
	apt-get install -y curl git-core build-essential zlib1g-dev libssl-dev openssl libopenssl-ruby1.9.1 ruby1.9.1 rubygems1.9.1 ruby1.9.1-dev
	gem install ruby-shadow chef --no-rdoc --no-ri
fi

`which chef-solo` --config solo.rb --json-attributes $json
