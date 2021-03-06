#! /usr/bin/env bash
sudo apt-get update 2> /dev/null

MYSQL_PASS="root"
#sudo debconf-set-selections < "mysql-server mysql-server/root_password select root"
#sudo debconf-set-selections < "mysql-server mysql-server/root_password_again select root"
sudo echo "mysql-server mysql-server/root_password select $MYSQL_PASS"|debconf-set-selections
sudo echo "mysql-server mysql-server/root_password_again select $MYSQL_PASS"|debconf-set-selections
echo "Installing mysql"
sudo apt-get install -y mysql-server 2> /dev/null 
sudo apt-get install -y mysql-client 2> /dev/null
#sudo service mysql restart 2> /dev/null


sudo sh /vagrant/mysql.sh 2> /dev/null
sudo sh /vagrant/base.sh 2> /dev/null
sudo sh /vagrant/apache.sh 2> /dev/null
sudo sh /vagrant/php.sh 2> /dev/null
sudo sh /vagrant/custom.sh 2> /dev/null
sudo service apache2 restart 2> /dev/null
