#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}install utilities${NC}"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install curl
