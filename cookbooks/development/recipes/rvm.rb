if node[:users]
  node[:users].each_pair do |username, info|

	rvm_installed = `which rvm`

	if rvm_installed.empty?i
          home_dir = info[:home]
          execute "su -c 'bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)' #{username}"
          execute "su -c 'source #{home_dir}/.rvm/scripts/rvm' #{username}"
          execute "su -c 'rvm install 1.8.7' #{username}" 
          execute "su -c 'rvm install 1.8.7' #{username}" 
	end

  end
end
