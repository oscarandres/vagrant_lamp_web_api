echo "Apache"
sudo apt-get install -y apache2 2> /dev/null
sudo a2enmod rewrite 2> /dev/null
APACHEUSR=`grep -c 'APACHE_RUN_USER=www-data' /etc/apache2/envvars`
APACHEGRP=`grep -c 'APACHE_RUN_GROUP=www-data' /etc/apache2/envvars`
sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/' /etc/apache2/envvars 2> /dev/null
sed -i 's/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars 2> /dev/null
echo "Adding privilegies to vagrant"
sudo chown -R vagrant:www-data /var/lock/apache2 2> /dev/null
sudo rm -rf /var/www 2> /dev/null
sudo ln -fs /vagrant/files/src /var/www 2> /dev/null
sudo sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default 2> /dev/null
sudo service apache2 restart 2> /dev/null