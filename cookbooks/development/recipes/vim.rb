package "vim"
package "vim-scripts"
package "vim-doc"
package "vim-latexsuite"
package "vim-gui-common"
package "vim-gnome"

if node[:users]
    node[:users].each_pair do |username, info|

      home_dir = info[:home]
      execute "rm -rf #{home_dir}.vimrc"
      execute "rm -rf #{home_dir}.vim"

      execute "cd #{home_dir} && git clone https://github.com/toranb/vimfiles.git #{home_dir}.vim"
      execute "cd #{home_dir}.vim && bundle exec rake"

      execute "cd #{home_dir}.vim && mkdir -p _backup"
      execute "cd #{home_dir}.vim && mkdir -p _temp"
      execute "chmod 777 #{home_dir}.vim/_backup"
      execute "chmod 777 #{home_dir}.vim/_temp"

      execute "sudo ln -sf /usr/bin/ack-grep /usr/local/bin/ack"
    end
end

