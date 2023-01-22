#!/usr/bin/env bash
#This script set up a server

sudo apt-get -y update
sudo apt-get -y install nginx
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
echo "Holberton School" | sudo tee /data/web_static/releases/test/index.html
sudo rm /data/web_static/current
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i "/server_name _/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default
sudo sed -i '49,54d' /etc/nginx/sites-available/default
sudo sed -i '48i\        location /hbnb_static/ {' /etc/nginx/sites-available/default
sudo sed -i '49i\		alias /data/web_static/current/;' /etc/nginx/sites-available/default
sudo sed -i '50i\		autoindex off;' /etc/nginx/sites-available/default
sudo sed -i '51i\	}' /etc/nginx/sites-available/default
sudo service nginx start
sudo service nginx restart
