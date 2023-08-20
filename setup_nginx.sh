#! /bin/bash

sudo echo 123321 > test.txt
sudo apt update
sudo apt install nginx -y
echo Created: ${time} | sudo tee /var/www/html/index.html
sudo systemctl status nginx > running.log
