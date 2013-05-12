if node[:users]
  node[:users].each_pair do |username, info|

	node_installed = `which npm`
	if node_installed.empty?
        execute "apt-get install python-software-properties python g++ make -y"
        execute "add-apt-repository ppa:chris-lea/node.js"
        execute "apt-get update"
        execute "apt-get install nodejs -y"
	end

  end
end
