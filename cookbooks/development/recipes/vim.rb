package "vim"
package "vim-scripts"
package "vim-doc"
package "vim-latexsuite"
package "vim-gui-common"
package "vim-gnome"
package "zsh"
package "tmux"


if node[:users]
    node[:users].each_pair do |username, info|

    home_dir = info[:home]

	vim_setup = `cd #{home_dir} && ls -la | grep .vim`
	if vim_setup.empty?
      execute "rm -rf #{home_dir}.vimrc"
      execute "rm -rf #{home_dir}.gvimrc"
      execute "rm -rf #{home_dir}.viminfo"
      execute "rm -rf #{home_dir}.zshrc"

      execute "su -c 'cd #{home_dir} && git init' #{username}"
      execute "su -c 'cd #{home_dir} && git remote add origin https://github.com/mattjmorrison/.dotfiles.git' #{username}"
      execute "su -c 'cd #{home_dir} && git pull origin master -f && git submodule update --recursive -f' #{username}"
      execute "su -c 'cd #{home_dir} && git submodule update --init' #{username}"
      execute "su -c 'cd #{home_dir}.vim && rake' #{username}"

      execute "sudo ln -sf /usr/bin/ack-grep /usr/local/bin/ack"
    end

    end
end

