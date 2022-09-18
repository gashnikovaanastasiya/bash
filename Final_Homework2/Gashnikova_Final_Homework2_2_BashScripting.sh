#!/bin/bash

rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
yum clean all 
yum install -y zabbix-agent 
systemctl restart zabbix-agent
systemctl enable zabbix-agent
sed -i 's/ServerActive=127.0.0.1/ServerActive=192.168.56.103/' /etc/zabbix/zabbix_agentd.conf
sed -i 's/Server=127.0.0.1/Server=192.168.56.103/' /etc/zabbix/zabbix_agentd.conf
systemctl start httpd
systemctl stop firewalld  
systemctl restart zabbix-agent
