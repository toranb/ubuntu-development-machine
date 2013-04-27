if node[:users]
  node[:users].each_pair do |username, info|

	rvm_installed = `which rvm`
	if rvm_installed.empty?
          home_dir = info[:home]
          execute "su -c '\curl -L https://get.rvm.io | bash -s stable --rails --ruby=1.9.3 --autolibs=enabled' #{username}"
          execute "su -c 'source #{home_dir}.rvm/scripts/rvm' #{username}"
        end

  end
end
