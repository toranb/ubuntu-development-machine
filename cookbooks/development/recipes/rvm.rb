if node[:users]
  node[:users].each_pair do |username, info|

	rvm_installed = `which rvm`
	if rvm_installed.empty?
          home_dir = info[:home]
          execute "su -c \"curl -L https://get.rvm.io | bash -s stable --autolibs=3\" #{username}"
        end

  end
end
