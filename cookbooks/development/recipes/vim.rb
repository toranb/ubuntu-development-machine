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

      execute "su -c 'cd #{home_dir} && git clone https://github.com/toranb/vimfiles.git #{home_dir}.vim' #{username}"
      execute "su -c 'cd #{home_dir}.vim && rake' #{username}"

      execute "sudo ln -sf /usr/bin/ack-grep /usr/local/bin/ack"
    end
end

