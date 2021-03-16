# 服务启停

使用由Websoft9提供的 Zabbix 部署方案，可能需要用到的服务如下：

### Zabbix-Server

```shell
sudo docker start zabbix-server
sudo docker restart zabbix-server
sudo docker stop zabbix-server
sudo docker stats zabbix-server
```

### Zabbix-Web

```shell
sudo docker start zabbix-web
sudo docker restart zabbix-web
sudo docker stop zabbix-web
sudo docker stats zabbix-web
```

### Zabbix-Proxy

```shell
sudo docker start zabbix-proxy
sudo docker restart zabbix-proxy
sudo docker stop zabbix-proxy
sudo docker stats zabbix-proxy
```

### phpMyAdmin

```shell
sudo docker start phpmyadmin
sudo docker restart phpmyadmin
sudo docker stop phpmyadmin
sudo docker stats phpmyadmin
```

### Nginx

```shell
sudo sudo systemctl start nginx
sudo sudo systemctl stop nginx
sudo sudo systemctl restart nginx
sudo sudo systemctl status nginx
```

### MySQL

```shell
sudo sudo systemctl start mysql
sudo sudo systemctl stop mysql
sudo sudo systemctl restart mysql
sudo sudo systemctl status mysql
```