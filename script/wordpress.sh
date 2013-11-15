# Refractiv WordPress install script

ARGS=("$@")
echo ""

if [ "${ARGS[0]}" == "" ]; then
{
  echo "Please specify an argument..."
}
fi

if [ "${ARGS[0]}" == "install" ]; then
{
  if [ "${ARGS[1]}" == "" ]; then
  {
    echo "Please specify a name for the website..."
  }
  else
  {
    echo "Installing WordPress site '${ARGS[1]}'..."

    cd /var/www
    sudo curl -O http://wordpress.org/latest.zip
    sudo unzip latest.zip
    sudo rm -rf latest.zip
    sudo mv wordpress ${ARGS[1]}
    sudo mkdir /var/www/${ARGS[1]}/logs
    sudo touch /var/www/${ARGS[1]}/logs/error.log
    sudo touch /var/www/${ARGS[1]}/logs/access.log
    sudo chmod 777 /var/www/${ARGS[1]}/
    sudo cp ~/.stack/vhosts/wordpress /etc/apache2/sites-available/${ARGS[1]}
    sudo sed -i s/wordpress\.dev/${ARGS[1]}/g /etc/apache2/sites-available/${ARGS[1]}
    sudo a2ensite ${ARGS[1]}
    sudo service apache2 reload

    echo "WordPress is now installed. Apache is listening at http://${ARGS[1]}.dev:8080"
    echo "Please update your hosts file..."
  }
  fi
}
fi