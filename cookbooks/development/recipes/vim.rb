package "vim-tiny"
package "vim-gnome"
package "vim"
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

      execute "su -c 'cd #{home_dir} && git clone https://github.com/JarrodCTaylor/imt_dotfiles.git' #{username}"

      execute "sudo ln -sf /usr/bin/ack-grep /usr/local/bin/ack"
    end

    end
end

