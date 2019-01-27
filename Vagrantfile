# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

servers = YAML.load_file('server-config.yml')

Vagrant.require_version '>= 1.9.0'
VAGRANTFILE_API_VERSION ||= "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    numNodes = servers["nodes"]
    r = numNodes..1
    (r.first).downto(r.last).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = servers["box"]
            node.vm.provider servers["provider"] do |v|
                v.name = servers["name"]
                v.customize ["modifyvm", :id, "--memory", servers["memory"], "--cpus", servers["cpus"]]
            end
            
            node.vm.hostname = servers["name"]

            node.vm.network :private_network, ip: servers["ip"]

            node.vm.provision "shell", path: "scripts/setup.sh"

            # Language
            if servers.include?("languages")
                if servers["languages"].to_s.length == 0
                    puts "Please check yaml file and chose languages"
                    exit
                end
                servers["languages"].each do |language|
                    if language == "php"
                        node.vm.provision "shell", path: "scripts/language/setup-php.sh"
                    elsif language == "ruby"
                        node.vm.provision "shell", path: "scripts/language/setup-ruby.sh"
                    else
                        puts "Please check yaml file, you has specified wrong languages."
                        exit
                    end
                end
            end

            # dbms
            if servers.include?("dbms")
                if servers["languages"].to_s.length == 0
                    puts "Please check yaml file and chose languages"
                    exit
                end
                servers["dbms"].each do |dbms|
                    if dbms == "mysql"
                        node.vm.provision "shell", path: "scripts/dbms/setup-mysql.sh"
                    else
                        puts "Please check yaml file, you has specified wrong dbms."
                        exit
                    end
                end
            end

            # database
            if servers.has_key?("database")
                servers["database"].each do |db|
                    if db == "phpmyadmin"
                        node.vm.provision "shell", path: "scripts/database/setup-phpmyadmin.sh"
                    else
                        puts "Please check yaml file, you has specified wrong database."
                        exit
                    end
                end
            end

            # webserver
            if servers.has_key?("webserver")
                servers["webserver"].each do |db|
                    if db == "apache2"
                        node.vm.provision "shell", path: "scripts/webserver/setup-apache.sh"
                    else
                        puts "Please check yaml file, you has specified wrong webserver."
                        exit
                    end
                end
            end

        end
    end
end