if node[:users]
  node[:users].each_pair do |username, info|

	node_installed = `which npm`
	if node_installed.empty?
        home_dir = info[:home]
        node_dir = "#{home_dir}Downloads/"
        node_exe = "#{home_dir}node/bin/node"
        npm_exe = "#{home_dir}node/bin/npm"

        execute "cd #{node_dir} && wget 'http://nodejs.org/dist/v0.8.9/node-v0.8.9-linux-x64.tar.gz'"
        execute "cd #{node_dir} && tar xvzf node-v0.8.9-linux-x64.tar.gz"
        execute "cd #{home_dir} && cp -r #{node_dir}node-v0.8.9-linux-x64 ."
        execute "cd #{home_dir} && mv node-v0.8.9-linux-x64 node"
        execute "cd /usr/bin/ && ln -s #{node_exe} /usr/bin/node"
        execute "cd /usr/bin/ && ln -s #{npm_exe} /usr/bin/npm"
	end

  end
end
