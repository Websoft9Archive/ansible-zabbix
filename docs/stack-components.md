# Parameters

The Zabbix deployment package contains a sequence software (referred to as "components") required for Zabbix to run. The important information such as the component name, installation directory path, configuration file path, port, version, etc. are listed below.

> Zabbix-Server, Zabbix-Agent, Zabbix-Web have included for this deployment solution

## Path

### Zabbix

This deployment solution based on Docker, run the command `docker ps` to list all container

```
$docker ps
CONTAINER ID   IMAGE                                              COMMAND                  CREATED       STATUS                 PORTS                                         NAMES
18540fbd8378   zabbix/zabbix-web-apache-mysql:centos-5.2-latest   "docker-entrypoint.sh"   7 hours ago   Up 7 hours (healthy)   0.0.0.0:80->8080/tcp, 0.0.0.0:443->8443/tcp   zabbix-web
ed7551e10595   zabbix/zabbix-agent:centos-5.2-latest              "/sbin/tini -- /usr/…"   7 hours ago   Up 7 hours             0.0.0.0:10050->10050/tcp                      zabbix-agent
584c72d4110c   zabbix/zabbix-server-mysql:centos-5.2-latest       "/sbin/tini -- /usr/…"   7 hours ago   Up 7 hours             0.0.0.0:10051->10051/tcp                      zabbix-server
cacb13aa8f36   zabbix/zabbix-java-gateway:centos-5.2-latest       "docker-entrypoint.s…"   7 hours ago   Up 7 hours             0.0.0.0:10052->10052/tcp                      zabbix-java-gateway
7f86df1ec563   zabbix/zabbix-snmptraps:centos-5.2-latest          "/usr/sbin/snmptrapd…"   7 hours ago   Up 7 hours             0.0.0.0:162->1162/udp                         zabbix-snmptraps
01bf45e40f13   phpmyadmin/phpmyadmin                              "/docker-entrypoint.…"   8 hours ago   Up 8 hours             0.0.0.0:9090->80/tcp                          phpmyadmin

```

Zabbix install directory: */usr/share/zabbix*  
Zabbix configuration file: */data/zabbix/.env.xxx*    
Docker Compose file: */data/wwwroot/zabbix/docker-compose.yml*  
Zabbix volume: */data/wwwroot/zabbix/zbx_env*  
Zabbix-Web database configuration file: */data/wwwroot/zabbix/.env_db_mysql*  
Zabbix-Proxy database configuration file: */data/wwwroot/zabbix/.env_db_mysql_proxy*  

### Nginx

Nginx vhost configuration file: */etc/nginx/conf.d/default.conf*    
Nginx main configuration file: */etc/nginx/nginx.conf*   
Nginx logs file: */var/log/nginx*  
Nginx rewrite rules directory: */etc/nginx/conf.d/rewrite*  
Nginx htpasswd file: */etc/nginx/.htpasswd/htpasswd.conf*  

### MySQL

MySQL installation directory: */usr/local/mysql*  
MySQL data directory: */data/mysql*  
MySQL configuration file: */etc/my.cnf*    

MySQL Web Management refer to [MySQL Management](/admin-mysql.md)

### Docker

Docker root directory: */var/lib/docker*  
Docker image directory: */var/lib/docker/image*   
Docker daemon.json: please create it when you need and save to to the directory */etc/docker*   

###  phpMyAdmin

phpMyAdmin is a visual MySQL management tool, is installed based on docker.  

phpMyAdmin directory：*/data/apps/phpmyadmin*  
phpMyAdmin docker compose file：*/data/apps/phpmyadmin/docker-compose.yml*  

## Ports

You can control(open or shut down) ports by **[Security Group Setting](https://support.websoft9.com/docs/faq/tech-instance.html)** of your Cloud Server whether the port can be accessed from Internet.

You can run the cmd `netstat -tunlp` to list all used ports, and we list the following most useful ports:

| Name | Number | Use |  Necessity |
| --- | --- | --- | --- |
| MySQL | 3306 | Remote connect MySQL | Optional |
| HTTP | 80 | HTTP access to Zabbix | Required |
| HTTP | 9006 | HTTP and Port to access Zabbix  | Optional |
| HTTPS | 443 | HTTPS access to Zabbix  | Optional |

## Version

You can see the version from product page of Marketplace. However, after being deployed to your server, the components will be automatically updated, resulting in a certain change in the version number. Therefore, the exact version number should be viewed by running the command on the server:


```shell
# Check all components version
sudo cat /data/logs/install_version.txt

# Linux Version
lsb_release -a

# Docker version
docker -v

# MySQL version
mysql -v

# Zabbix version:
docker images |grep zabbix-server
```