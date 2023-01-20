#!/usr/bin/env bash
#This script set up a server

sudo apt get -y update
sudo apt get -y install nginx
mkdir -p /data/
mkdir -p /data/web_static/
mkdir -p /data/web_static/releases/
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
touch -p /data/web_static/releases/test/index.html
echo "Nginx don dey work" >> /data/web_static/releases/test/index.html
rm /data/web_static/current
ln -s /data/web_static/current /data/web_static/releases/test/
sudo chown -R ubuntu:ubuntu /data/
