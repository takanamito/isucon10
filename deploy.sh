#!/bin/bash -ex

export PATH=/home/isucon/local/ruby/bin:$PATH

sudo cp ./isuumo.ruby.service /etc/systemd/system/isuumo.ruby.service
sudo cp ./nginx.conf /etc/nginx/nginx.conf
sudo cp ./isuumo.conf /etc/nginx/sites-available/isuumo.conf
sudo cp ./mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

sudo cp ./sysctl.conf /etc/sysctl.conf

cd /home/isucon/isuumo/webapp/ruby
git pull origin master
bundle check || bundle install --path ./vender/bundle --jobs 300

sudo systemctl daemon-reload
sudo sysctl -p
sudo systemctl restart mysql
sudo systemctl restart isuumo.ruby
sudo systemctl restart nginx
