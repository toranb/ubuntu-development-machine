if node[:users]
  node[:users].each_pair do |username, info|

      home_dir = info[:home]
      node_dir = "#{home_dir}Downloads/"
      node_download = "#{node_dir}joyent-node-v0.6.15-0-gf160a45.zip"
      node_extracted_dir = "#{node_dir}joyent-node/"

      execute "rm -rf #{node_download}"
      execute "rm -rf #{node_extracted_dir}"

      execute "wget 'https://github.com/joyent/node/zipball/v0.6.15' -O #{node_download}"
      execute "unzip #{node_download} -d #{node_extracted_dir}"
       
      execute "cd #{node_extracted_dir}joyent-node-d90d46f/ && ./configure && make && make install"

      execute "npm install jasmine-node"
      execute "npm install jsdom"
      execute "npm install jasmine-jquery"
  end
end
