#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}install apache${NC}"
sudo apt-get -y install apache2
sudo service apache2 start

echo -e "${RED}Adjust the Firewall to Allow Web Traffic${NC}"
sudo ufw allow "Apache"

sudo mount --bind /vagrant/web/ /var/www/html/