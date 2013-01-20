package "libfreetype6"
package "libfreetype6-dev"

if node[:users]
  node[:users].each_pair do |username, info|

    phantomjs_installed = `which phantomjs`
    if phantomjs_installed.empty?
      home_dir = info[:home]
      phantom_dir = "#{home_dir}Downloads/"
      phantom_download = "#{phantom_dir}phantomjs-1.8.1-linux-x86_64.tar.bz2"
      phantom_extracted_dir = "#{phantom_dir}phantomjs-1.8.1-linux-x86_64/"

      execute "wget 'http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-x86_64.tar.bz2' -O #{phantom_download}"
      execute "cd #{phantom_dir} && tar -xvjpf phantomjs-1.8.1-linux-x86_64.tar.bz2"

      execute "mv #{phantom_extracted_dir} phantomjs"
      execute "mv phantomjs /usr/local/share/phantomjs-1.8.1-linux-x86_64"
      execute "ln -s /usr/local/share/phantomjs-1.8.1-linux-x86_64/ /usr/local/share/phantomjs"
      execute "ln -s /usr/local/share/phantomjs/bin/phantomjs /usr/local/bin/phantomjs"
    end

  end
end

