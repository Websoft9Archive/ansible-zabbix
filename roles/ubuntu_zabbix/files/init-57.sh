#!/bin/bash

old_password=$(cat /credentials/password.txt | awk -F ":" '{print $2}' )
root_password=$(</dev/urandom tr -dc '0-9!@#$%a-zA-Z' | head -c10)
zabbix_password=$(</dev/urandom tr -dc '0-9!@#$%a-zA-Z' | head -c10)

systemctl restart mysqld
mysqladmin -uroot -p${old_password} -h localhost password $root_password
mysqladmin -uzabbix -p${old_password} -h localhost password $zabbix_password

echo 'Databases username: root  Databases password: '$root_password  > /credentials/password.txt
echo 'Databases username: pimcore  Databases password: '$zabbix_password  >> /credentials/password.txt


sed -i "s/\/root\/init.sh//" /etc/rc.local
rm -rf /root/init.sh

