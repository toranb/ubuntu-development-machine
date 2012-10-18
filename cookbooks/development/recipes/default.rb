execute "apt-get install rake"

node[:base_packages].each do |pkg|
  package pkg do
    puts "installing #{pkg}..."
    :upgrade
  end
end

node[:easy_install_packages].each do |pkg|
  puts "installing #{pkg}..."
  execute "easy_install #{pkg}"
end

node[:pip_packages].each do |pkg|
  puts "installing #{pkg}..."
  execute "pip install #{pkg}"
end
