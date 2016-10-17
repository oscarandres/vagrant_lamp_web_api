sudo ln -s /vagrant/files/apache/site.conf /etc/apache2/sites-enabled/site.conf 2> /dev/null
sudo service apache2 restart 2> /dev/null
sudo service mysql restart 2> /dev/null
mysql -u root -proot < /vagrant/files/database/user.sql 2> /dev/null
