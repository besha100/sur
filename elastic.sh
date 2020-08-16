#!/bin/bash
sed -i 's,url,'"$elkurl"',g' /etc/logstash/conf.d/logstash.conf && sudo sed -i 's,psw,'"$passwd"',g' /etc/logstash/conf.d/logstash.conf
sudo /etc/init.d/suricata start && sudo /etc/init.d/logstash start
DATE=`date +%Y%m%d`
HOUR=`date +%H`
MINUTE=`date +%M`
while true; do
        echo Suricata is running since $DATE:$HOUR:$MINUTE
        sleep 360
done
