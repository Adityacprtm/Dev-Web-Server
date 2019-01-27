#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}Installing php${NC}"
sudo apt-get -y update
sudo apt-get -y install php libapache2-mod-php php-mysql php-mbstring php-gettext

sudo mv /etc/apache2/mods-enabled/dir.conf{,.original}

sudo echo "<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" >> /etc/apache2/mods-enabled/dir.conf

sudo systemctl restart apache2