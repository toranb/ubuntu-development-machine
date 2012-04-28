node[:base_packages].each do |pkg|
  package pkg do
    :upgrade
  end
end

node[:easy_install_packages].each do |pkg|
  execute "easy_install #{pkg}"
end

node[:pip_packages].each do |pkg|
  execute "pip install #{pkg}"
end
