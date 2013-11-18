sudo aptitude update

echo "Installing git..."

sudo apt-get -fy install git curl unzip
git clone https://github.com/Refractiv/stack.git ~/.stack

echo "Installing Apache..."

sudo apt-get -fy install apache2
sudo cp ~/.stack/conf/ports.conf /etc/apache2/ports.conf
sudo a2enmod rewrite

echo "Installing PHP..."

sudo apt-get -fy install libapache2-mod-php5
sudo a2enmod php5

echo "Installing MySQL..."

sudo apt-get -fy install libapache2-mod-auth-mysql php5-mysql mysql-server

echo "Installing WordPress..."

cd /vagrant
sudo curl -O http://wordpress.org/latest.zip
sudo unzip latest.zip
sudo rm -rf latest.zip
sudo mkdir /vagrant/logs
sudo touch /vagrant/logs/error.log
sudo touch /vagrant/logs/access.log
sudo chmod 777 /vagrant
sudo cp ~/.stack/vhosts/wordpress /etc/apache2/sites-available/wordpress
sudo a2ensite wordpress

echo "Installing PHPMyAdmin..."

sudo apt-get -fy install phpmyadmin
sudo sed -i '$ a\Include /etc/phpmyadmin/apache.conf' /etc/apache2/apache2.conf
sudo cp ~/.stack/vhosts/phpmyadmin /etc/apache2/sites-available/phpmyadmin
sudo a2ensite phpmyadmin

echo "Restarting Apache 2..."

sudo service apache2 restart
