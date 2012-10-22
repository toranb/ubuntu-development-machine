yeoman_installed = `which yeoman`
if yeoman_installed.empty?
  execute "curl -L get.yeoman.io | bash"
end
