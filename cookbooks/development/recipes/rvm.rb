if node[:users]
  node[:users].each_pair do |username, info|

	rvm_installed = `which rvm`
	if rvm_installed.empty?
          home_dir = info[:home]
          execute "su -c 'bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)' #{username}"
          execute "su -c 'source #{home_dir}.rvm/scripts/rvm' #{username}"
          node[:ruby_versions].each do |version_number|
            execute "su -c '#{home_dir}.rvm/bin/rvm install #{version_number}' #{username}" 
          end
        end

  end
end
