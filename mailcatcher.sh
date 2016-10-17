echo "Installing Mailcatcher"
sudo apt-get install -qq libsqlite3-dev ruby1.9.1-dev g++ msmtp 2> /dev/null
sudo gem install mailcatcher 2> /dev/null
mailcatcher --ip=0.0.0.0 2> /dev/null
#sudo cp /vagrant/files/php/php.ini /etc/php5/apache2/