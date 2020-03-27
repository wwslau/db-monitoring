# dbco-tool-box

Components installed:
Docker
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

Configuration change:
vagrant reload

Restart:
service prometheus restart
systemctl start grafana-server
sudo docker restart dev-mysql
