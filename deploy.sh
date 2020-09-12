#!/bin/bash -ex

export PATH=/home/isucon/local/ruby/bin:$PATH

cd /home/isucon/isuumo/webapp/ruby
git pull origin master
bundle check || bundle install --path ./vender/bundle --jobs 300

sudo cp ./isuumo.ruby.service /etc/systemd/system/isuumo.ruby.service

sudo systemctl daemon-reload
sudo sysctl -p
sudo systemctl restart isuumo.ruby
