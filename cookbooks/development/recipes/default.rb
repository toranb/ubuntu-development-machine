node[:base_packages].each do |pkg|
  package pkg do
    :upgrade
  end
end
