#!/bin/bash

psw="Helloworld1!"
pass="New_password1"
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
yum clean all
yum install -y zabbix-server-mysql zabbix-agent
yum install -y centos-release-scl
sed -i '0,/enabled=0/{s/enabled=0/enabled=1/}' /etc/yum.repos.d/zabbix.repo
yum install -y zabbix-web-mysql-scl zabbix-apache-conf-scl
mysql -uroot --password="$psw" --execute="create database zabbix character set utf8 collate utf8_bin; create user zabbix@localhost identified by '"$pass"'; grant all privileges on zabbix.* to zabbix@localhost;"
zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
# DBPasswd
echo "DBPassword=New_password1" >> /etc/zabbix/zabbix_server.conf
# php_value
sed -i 's|Riga|Minsk|' /etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf
sed -i 's|;||' /etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf
systemctl restart zabbix-server zabbix-agent httpd rh-php72-php-fpm
systemctl enable zabbix-server zabbix-agent httpd rh-php72-php-fpm
#job failed so
mysql -u root --password="$psw" --execute="alter user 'zabbix'@'localhost' identified with mysql_native_password by 'New_password1';grant all privileges on zabbix.* to zabbix@localhost;flush privileges;"
systemctl restart zabbix-server zabbix-agent httpd rh-php72-php-fpm
setsebool -P httpd_can_network_connect on
setsebool -P httpd_can_connect_zabbix 1
setsebool -P zabbix_can_network 1
setsebool -P daemons_enable_cluster_mode 1
ausearch -c 'zabbix_server' --raw | audit2allow -M my-zabbixserver
semodule -i my-zabbixserver.pp


