FROM ubuntu:18.04
MAINTAINER Mohamed Basher
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y apt-utils software-properties-common
RUN add-apt-repository ppa:oisf/suricata-stable
RUN apt-get update
RUN apt-get install -y suricata && apt clean
RUN apt-get install -y git && apt-get install -y sudo && apt-get install -y iputils-ping
RUN apt-get install -y logrotate && apt-get install -y net-tools && apt-get install -y vim
ADD suricata.sh /suricata.sh
ADD logstash.sh /logstash.sh
ADD suricata /suricata
ADD logstash.conf /logstash.conf
ADD conf /conf
ADD rules /rules
RUN chmod +x suricata.sh && bash ./suricata.sh 
RUN chmod +x logstash.sh && bash ./logstash.sh
COPY ./elastic.sh /
RUN chmod +x /elastic.sh
ENTRYPOINT ["/elastic.sh"]
