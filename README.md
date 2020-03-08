# dbco-tool-box

Components installed:
MySQL

Pre-req:
Install vagrant and Virtual box

Usage:
vagrant up
vagrant ssh

Access MySQL container while in vagrant ssh:
sudo docker exec -it dev-mysql bash
mysql -uroot -pexample

To destroy vagrant env:
vagrant destroy
