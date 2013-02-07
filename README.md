# Refractiv Stack

## Ubuntu LAMP stack installer for WordPress development

Tested with Ubuntu 12.04 LTS

To run the install, paste the following into a terminal:

    wget -O - https://raw.github.com/Refractiv/stack/master/install.sh | bash -s

## What's installed?

+ git
+ cURL
+ Apache
+ PHP
+ MySQL
+ WordPress (latest)
+ phpMyAdmin
+ Ruby
+ Rubygems
+ Capistrano

## Included extras

WordPress is automatically installed and configured as an apache VirtualHost. You can reach a fresh version of WordPress in your browser by adding wordpress.dev to your hosts file:

    <server_ip> wordpress.dev

You can also do the same with phpmyadmin.dev to access phpMyAdmin.

Apache is configured to listen on port 8080. e.g.

    http://wordpress.dev:8080

## WordPress instance installer script

You can install a new instance of WordPress with the installer script provided:

    ~/.stack/script/wordpress.sh install <domain_name>

For example:

    ~/.stack/script/wordpress.sh install example.com

This will fetch the latest version of WordPress and configure apache to listen for the appropriate host

    http://example.com.dev:8080

Notice that ".dev" is suffixed to the domain name. You will need to update your hosts file accordingly.

## TODO: Capistrano Deployer