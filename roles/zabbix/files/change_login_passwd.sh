field_lines=`mysql -uroot -p$new_password -h 127.0.0.1 -NBe "select count(*) from zabbix.users where  alias='Admin';"`
while [ $field_lines -ge 1 ]
do
    password_lines=`mysql -uroot -p$new_password -h 127.0.0.1 -NBe "select count(*) from zabbix.users where  length(passwd) < 60;"`
    sudo mysql -uroot -p"$new_password" -h 127.0.0.1 -e "update zabbix.users set passwd=md5('$new_password') where alias='Admin';"
    if [ $password_lines -ge  1 ];then
       break
    fi
done