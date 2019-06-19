#!/bin/bash

old_password=$(cat /credentials/password.txt | awk -F ':' '{print $2}' | sed -n '2p' )
root_password=$(</dev/urandom tr -dc '0-9!@#$%a-zA-Z' | head -c10)
zabbix_password=$(</dev/urandom tr -dc '0-9!@#$%a-zA-Z' | head -c10)

systemctl restart mysqld
mysqladmin -uroot -p${old_password} -h localhost password $root_password

# 修改mariadb普通用户密码
touch /root/changepass.txt
echo -e "use mysql;\nupdate user set password = password('$zabbix_password') where user = 'zabbix';\nflush privileges;" > /root/changepass.txt
mysql -uroot -p${root_password} < /root/changepass.txt

echo -e 'Database username: root \nDatabase password:'$root_password  > /credentials/password.txt
echo -e 'Database username: zabbix \nDatabase password:'$zabbix_password  >> /credentials/password.txt

sed -i "s/DBPassword=${old_password}/DBPassword=${zabbix_password}/g" /etc/zabbix/zabbix_server.conf
systemctl restart zabbix-server

sed -i "s/\/root\/init.sh//" /etc/rc.local
rm -rf /root/init.sh /root/changepass.txt