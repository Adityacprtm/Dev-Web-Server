# Dev-Web-Server
Web Server for Website Development

## Requirement
- Vagrant
- VirtualBox

## Specification
### OS
- Ubuntu 18.04
### Installed
- curl

## Available Apps
### Languages
- php

### DBMS
- mysql

### Database
- phpmyadmin

### Web Server
- apache2

## Installation
Clone this repository

`$ git clone https://github.com/Adityacprtm/Dev-Web-Server.git`

Move to lobaha deirectory

`$ cd Dev-Web-Server`

Configure **server-config.yml**, like the following example: (for now, only a few applications are available)

```
---
name: web-server
box: ubuntu/bionic64
ip: "192.168.56.111"
memory: 512
cpus: 1
provider: virtualbox

nodes: 1

languages:
  - php

dbms:
  - mysql

databases:
  - phpmyadmin

webserver: 
  - apache2
```

Wake up the Vagrant

`$ vagrant up`

## Others

Your website location

`/vagrant/web`