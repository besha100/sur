#!/bin/bash
rm -f /etc/apt/sources.list.d/webupd8team-java.list
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -y
sudo apt install openjdk-8-jdk -y
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update -y && sudo apt-get install logstash -y
sudo rm -f /etc/logstash/conf.d/logstash.conf
sudo cp logstash.conf /etc/logstash/conf.d/ && sudo cp suricata /etc/logrotate.d/
sudo logrotate /etc/logrotate.d/suricata && sudo chmod 775 /var/log/suricata/eve.json