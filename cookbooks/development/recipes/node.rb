if node[:users]
  node[:users].each_pair do |username, info|

	node_installed = `which node`
	if node_installed.empty?
	  home_dir = info[:home]
	  node_dir = "#{home_dir}Downloads/"
	  node_download = "#{node_dir}joyent-node-v0.8.9-0-gb88c390.zip"
	  node_extracted_dir = "#{node_dir}joyent-node/"

	  execute "wget 'https://github.com/joyent/node/zipball/v0.8.9' -O #{node_download}"
	  execute "unzip #{node_download} -d #{node_extracted_dir}"
	   
	  execute "cd #{node_extracted_dir}joyent-node-a5726e8/ && ./configure && make && make install"
	end

  end
end
