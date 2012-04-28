if node[:users]
    node[:users].each_pair do |username, info|

      home_dir = info[:home]

      execute "rm -rf #{home_dir}virtualenvs"

      directory "#{home_dir}virtualenvs" do
        owner username
        group username
        mode 0764
        recursive true
      end

    end
end