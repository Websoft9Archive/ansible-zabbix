#!/bin/bash

old_password=$(cat /credentials/password.txt | awk -F ':' '{print $2}' | sed -n '2p')
new_root_password=$(pwgen -Acns 8 1)
zabbix_password=$(pwgen -Acns 8 1)

systemctl restart mysqld

# 修改mariadb普通用户密码
touch /root/changepass.txt
echo -e "use mysql;\nupdate user set password = password('${zabbix_password}') where user = 'zabbix';\nflush privileges;" > /root/changepass.txt
mysql -uroot -p${old_password} < /root/changepass.txt

# 修改root密码
mysqladmin -uroot -p${old_password} password ${new_root_password}

sed -i "s/DBPassword=${old_password}/DBPassword=${zabbix_password}/g" /etc/zabbix/zabbix_server.conf
sed -i "s/DBPassword=${old_password}/DBPassword=${zabbix_password}/g" /etc/zabbix/web/zabbix.conf.php
systemctl restart zabbix-server

sed -i "s/MySQL password:${old_password}/MySQL password:${new_root_password}/g" /credentials/password.txt
sed -i "s/database password:${old_password}/database password:${zabbix_password}/g" /credentials/password.txt

sed -i "s/\/root\/init.sh//" /etc/rc.local
rm -rf /root/init.sh /root/changepass.txt