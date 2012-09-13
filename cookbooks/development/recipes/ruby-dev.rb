rvm_installed = `which rvm`
if rvm_installed.empty?
    execute "setup-rake-for-local-development" do
        command "ln -sf /usr/bin/ruby1.9.1 /usr/local/bin/ruby && ln -sf /usr/bin/gem1.9.1 /usr/local/bin/gem && gem install rake -v 0.9.2 --no-ri --no-rdoc"
        action :run
    end
    execute "curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable"
end
