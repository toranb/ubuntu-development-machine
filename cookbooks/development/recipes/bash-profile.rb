if node[:users]
    node[:users].each_pair do |username, info|

    home_dir = info[:home]
    execute "rm -rf #{home_dir}.bash_aliases"
    execute "rm -rf #{home_dir}.bash_colors.sh"
    execute "rm -rf #{home_dir}.gitconfig"
    execute "rm -rf #{home_dir}.bash_profile"
    execute "rm -rf #{home_dir}.bashrc"

    cookbook_file "#{home_dir}.bash_aliases" do
      source ".bash_aliases"
      owner username
      group username
      mode 0764
    end

    cookbook_file "#{home_dir}.bash_profile" do
      source ".bash_profile"
      owner username
      group username
      mode 0764
    end

    cookbook_file "#{home_dir}.bash_colors.sh" do
        source ".bash_colors.sh"
        owner username
        group username
        mode 0764
    end

    template "#{home_dir}.bashrc" do
      source "bashrc.erb"
      variables(
        :home_directory => info[:home]
      )
      owner username
      group username
      mode 0764
    end

    template "#{home_dir}.gitconfig" do
      source "gitconfig.erb"
      variables(
        :full_name => info[:full_name],
        :email_address => info[:email_address]
      )
      owner username
      group username
      mode 0764
    end

    end
end
