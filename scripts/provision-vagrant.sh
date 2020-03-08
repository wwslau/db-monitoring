#!/bin/bash

echo "Install system requirements"
apt-get --quiet update
apt-get install -y --no-install-recommends \
	curl \
	git

echo "Setup home directory"
ln -s /vagrant/ /home/vagrant/data
chown vagrant.vagrant /home/vagrant/data

systemctl daemon-reload
