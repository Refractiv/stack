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

You can also do the same with phpmyadmin.dev