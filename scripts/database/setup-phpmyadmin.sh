#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}installing phpmyadmin${NC}"
sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install phpmyadmin
#export DEBIAN_FRONTEND=noninteractive
#sudo apt-get -yq install phpmyadmin
sudo cp /vagrant/scripts/database/phpmyadmin.conf /etc/dbconfig-common/phpmyadmin.conf
sudo dpkg-reconfigure --frontend=noninteractive phpmyadmin
sudo phpenmod mbstring

# link phpmyadmin to apache
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin.conf

sudo systemctl restart apache2