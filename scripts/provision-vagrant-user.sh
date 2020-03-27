#!/bin/bash

echo "Setup MySQL connector"
cd /opt
sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.16.tar.gz
sudo tar xvfz mysql-connector-java-8.0.16.tar.gz

echo "Setup Terraform"
sudo mkdir /opt/terraform
cd /opt/terraform
sudo wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
#sudo wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
sudo apt-get -y install zip
sudo unzip terraform_0.11.14_linux_amd64.zip

#echo "Install Jenkins"
#sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
#echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
#sudo apt-get update
#sudo apt-get -y install jenkins
#sudo systemctl start jenkins
#sudo ufw allow 8080
#sudo ufw status
#sudo ufw allow OpenSSH
#sudo ufw enable

cd /vagrant/

#echo "Install openjdk-8-jre-headless"
#sudo apt -y install openjdk-8-jre-headless

#echo "Install AWS CLI"
#pip3 install awscli --upgrade --user

echo "Setup Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce


echo "Setup login directory"
echo "cd /home/vagrant/data/"  >> /home/vagrant/.bash_profile
echo "source ~/.bashrc"  >> /home/vagrant/.bash_profile
#echo "export PATH=$PATH:/opt/liquibase:/opt/terraform" >> /home/vagrant/.bash_profile

echo "Install Prometheus"
git clone https://github.com/in4it/prometheus-course.git
cd /prometheus-course/scripts
. ./1-install.sh
service prometheus restart

echo "Install Exporter""

echo "Install Grafana"
cd /prometheus-course/scripts
. ./3-install-grafana.sh

echo "Startup Dev MySQL container"
sudo  docker run -e MYSQL_ROOT_PASSWORD=example --name dev-mysql -d -p=3306:3306 mysql

echo "Startup Dev Postgres container"

#echo "Startup Prometheus container"
#sudo docker run \
#    -p 9090:9090 \
#    -v /vagrant/prometheus.yml:/etc/prometheus/prometheus.yml \
#    prom/prometheus
