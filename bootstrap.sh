#!/usr/bin/env bash
PROJECT_NAME="terrenal"
MYSQL_USER="root"
MYSQL_PASS="root"
HOSTNAME="terrenal.com"

#sudo apt-get install software-properties-common 2> /dev/null
sudo apt-get update 2> /dev/null
sudo apt-get install -y software-properties-common python-software-properties 2> /dev/null
sudo apt-get install -y make 2> /dev/null
sudo apt-get install -y vim 2> /dev/null
sudo apt-get install -y apache2 2> /dev/null
sudo apt-get install -y openssl 2> /dev/null
sudo a2enmod rewrite 2> /dev/null

APACHEUSR=`grep -c 'APACHE_RUN_USER=www-data' /etc/apache2/envvars`
APACHEGRP=`grep -c 'APACHE_RUN_GROUP=www-data' /etc/apache2/envvars`
if [ APACHEUSR ]; then
    sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
fi
if [ APACHEGRP ]; then
    sed -i 's/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars
fi
sudo chown -R vagrant:www-data /var/lock/apache2

echo mysql-server mysql-server/root_password select $MYSQL_PASS | debconf-set-selections
echo mysql-server mysql-server/root_password_again select $MYSQL_PASS | debconf-set-selections
sudo apt-get install -y mysql-server 2> /dev/null
sudo apt-get install -y mysql-client 2> /dev/null
sudo service mysql restart 2> /dev/null
echo "Installing curl, unzip, sendmail, msmtp ca-certificates"
sudo apt-get install -y curl unzip openjdk-7-jre-headless sendmail msmtp ca-certificates 2> /dev/null
echo "Setting Site Database"
mysql -uroot -proot < /vagrant/files/database/$PROJECT_NAME.sql
#if [ ! -f /var/log/dbinstalled ];
#then
#    echo "CREATE USER 'mysqluser'@'localhost' IDENTIFIED BY 'USERPASSWORD'" | mysql -uroot -proot
#    echo "CREATE DATABASE internal" | mysql -uroot -proot
#    echo "GRANT ALL ON internal.* TO 'mysqluser'@'localhost'" | mysql -uroot -proot
#    echo "flush privileges" | mysql -uroot -proot
#    touch /var/log/dbinstalled
#    if [ -f /vagrant/files/database/$PROJECT_NAME.sql ];
#    then
#        mysql -uroot -proot $PROJECT_NAME < /vagrant/database/$PROJECT_NAME.sql
#    fi
#fi
echo "Installing php"
sudo apt-get install -y php5 php-pear php5-dev php5-gd php5-curl php5-mcrypt php5-mysql php5-xdebug 2> /dev/null

#versioning packages
echo "Installing git and svn"
sudo apt-get install -y git 2> /dev/null
#sudo add-apt-repository 'deb http://ppa.launchpad.net/svn/ppa/ubuntu precise main'
#sudo add-apt-repository 'deb-src http://ppa.launchpad.net/svn/ppa/ubuntu precise main'
#sudo apt-get update 2> /dev/null
sudo apt-get install -y subversion 2> /dev/null

# if /var/www is not a symlink then create the symlink and set up apache
if [ ! -h /var/www ];
then
#    rm -rf /var/www
#    ln -fs /vagrant /var/www
    sudo a2enmod rewrite 2> /dev/null
    sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default
    sudo service apache2 restart 2> /dev/null
fi

#copy apache host
sudo cp /vagrant/files/apache/$PROJECT_NAME.txt /etc/apache2/sites-available/$PROJECT_NAME 2> /dev/null
sudo ln -s /etc/apache2/sites-available/$PROJECT_NAME /etc/apache2/sites-enabled/$PROJECT_NAME 2> /dev/null
sudo cp /vagrant/files/host/hosts.txt /etc/hosts 2> /dev/null
sudo service apache2 restart 2> /dev/null

# Postfix
#sudo apt-get install -y sendmail-bin 2> /dev/null
#echo postfix postfix/mailname string $HOSTNAME | debconf-set-selections
#echo postfix postfix/main_mailer_type string 'Internet Site' | debconf-set-selections
#sudo apt-get install -y postfix 2> /dev/null
#service postfix restart 2> /dev/null

#Mailcatcher
echo "Installing Mailcatcher"
sudo apt-get install -qq libsqlite3-dev ruby1.9.1-dev g++ msmtp 2> /dev/null
sudo gem install mailcatcher 2> /dev/null
mailcatcher --ip=0.0.0.0 2> /dev/null
sudo cp /vagrant/files/php/php.ini /etc/php5/apache2/

# Install xhprof
#wget -q https://github.com/facebook/xhprof/archive/master.zip
#unzip master.zip
#cd xhprof-master/extension
#sudo phpize
#sudo ./configure
#make
#make install
#echo "extension=xhprof.so" >> /etc/php5/conf.d/xhprof.ini
#echo "xhprof.output_dir=/tmp" >> /etc/php5/conf.d/xhprof.ini
#cd -
#sudo rm -f master.zip 2> /dev/null
#sudo service apache2 restart 2> /dev/null


#Log Stash
curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz 2> /dev/null
tar -zxvf logstash-1.4.2.tar.gz 2> /dev/null
sudo mv logstash-1.4.2 /opt/logstash 2> /dev/null
rm logstash-1.4.2.tar.gz 2> /dev/null
curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz 2> /dev/null
tar zxvf elasticsearch-1.1.1.tar.gz  2> /dev/null
rm elasticsearch-1.1.1.tar.gz 2> /dev/null  2> /dev/null
./elasticsearch-1.1.1/bin/elasticsearch -f /vagrant/files/logstash/logstash-total.conf  2> /dev/null

##### CLEAN UP #####
sudo dpkg --configure -a 2> /dev/null
apt-get autoremove -y 2> /dev/null

sudo hostname $HOSTNAME 2> /dev/null