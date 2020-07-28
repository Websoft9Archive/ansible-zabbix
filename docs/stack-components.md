# Parameters

The Zabbix deployment package contains a sequence software (referred to as "components") required for Zabbix to run. The important information such as the component name, installation directory path, configuration file path, port, version, etc. are listed below.

> Zabbix-Server, Zabbix-Agent, Zabbix-Web have included for this deployment solution

## Path

### Zabbix

Zabbix installation directory: */usr/share/zabbix*  
Zabbix configuration directory: */etc/zabbix*    
Zabbix-Agent logs file：*/var/log/zabbix/zabbix_agentd.log*     
Zabbix-Server logs file：*/var/log/zabbix/zabbix_server.log*  

> Zabbix configuration file includes the database connection information

### PHP

PHP configuration file: */etc/php/7.2/apache2/php.ini*  
PHP Modules configurations directory: */etc/php/7.2/mods-available*

### Apache

Apache vhost configuration directory：*/etc/httpd/vhost*  
Apache main configuration file：*/etc/httpd/conf/httpd.conf*  
Apache logs file：*/var/log/apache*  

### MariaDB

MySQL installation directory: */usr/local/mysql*  
MySQL data directory: */data/mysql*  
MySQL configuration file: */etc/my.cnf*     

## Ports

You can control(open or shut down) ports by **[Security Group Setting](https://support.websoft9.com/docs/faq/tech-instance.html)** of your Cloud Server whether the port can be accessed from Internet.

You can run the cmd `netstat -tunlp` to list all used ports, and we list the following most useful ports:

| Name | Number | Use |  Necessity |
| --- | --- | --- | --- |
| MySQL | 3306 | Remote connect MySQL | Optional |
| HTTP | 80 | HTTP requests for Zabbix | Required |
| HTTPS | 443 | HTTPS requests Zabbix | Optional |

## Version

You can see the version from product page of Marketplace. However, after being deployed to your server, the components will be automatically updated, resulting in a certain change in the version number. Therefore, the exact version number should be viewed by running the command on the server:

```shell
# Check all components version
sudo cat /data/logs/install_version.txt

# Linux Version
lsb_release -a

# PHP Version
php -v

# List Installed PHP Modules
php -m

# Apache version on Ubuntu
apache2 -v

# Apache version on Centos
httpd -v

# List Installed Apache Modules
apachectl -M

# MySQL version:
mysql -V
```