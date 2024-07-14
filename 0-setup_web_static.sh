#!/usr/bin/env bash
# bash script that sets up web serveres for deployment

# installing Nginx
sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'

# create folders
sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/

#create a fake HTML file
sudo touch /data/web_static/releases/test/index.html

#add hello world
sudo echo "<html>
   <head>
   </head>
   <body>
        Hey its me
    </body>
    </html>" | sudo tee /data/web_static/releases/test/index.html

#create a symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

#give ownership of the data folder to ubuntu user AND group
sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default

# restart nginx
sudo service nginx restart
