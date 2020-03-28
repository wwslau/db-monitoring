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
systemctl start prometheus
systemctl start grafana-server
sudo docker restart dev-mysql
sudo docker restart dev-postgres
sudo docker restart mysql-exporter

Git operations:
git push origin master
