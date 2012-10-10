if node[:users]
  node[:users].each_pair do |username, info|

	rvm_installed = `which rvm`

	if rvm_installed.empty?
          home_dir = info[:home]
          default_rvm = node[:default_ruby_version]
          execute "su -c 'bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)' #{username}"
          execute "su -c 'source #{home_dir}/.rvm/scripts/rvm' #{username}"
          node[:ruby_versions].each_value di |version_number|
            execute "su -c 'rvm install #{version_number}' #{username}" 
          end
	  execute "su -c 'rvm --default use #{default_rvm}' #{username}"
        end

  end
end
