# Parameters

<<<<<<< HEAD
Zabbix 预装包包含 Zabbix 运行所需一序列支撑软件（简称为“组件”），下面列出主要组件名称、安装路径、配置文件地址、端口、版本等重要的信息。
=======
The Zabbix deployment package contains a sequence software (referred to as "components") required for Zabbix to run. The important information such as the component name, installation directory path, configuration file path, port, version, etc. are listed below.
>>>>>>> 07ead7fdea7c6e2a4c1c43fdc95d2b0273206c64

## Path

### Zabbix

<<<<<<< HEAD
Zabbix 安装目录： */opt/Zabbix/*  
Zabbix 配置文件： */etc/zabbix/zabbix_server.conf*  
Zabbix 数据目录： */opt/Zabbix/data*  
Zabbix 日志目录： */var/log/zabbix/zabbix_server.log*
=======
Zabbix installation directory: */data/wwwroot/Zabbix*  
Zabbix configuration file: */data/wwwroot/prestashop/app/config/parameters.php*  
>>>>>>> 07ead7fdea7c6e2a4c1c43fdc95d2b0273206c64

### PHP

PHP configuration file: */etc/php.ini*  
PHP Modules configurations directory: */etc/php.d*

<<<<<<< HEAD
Zabbix 使用 Go 语言开发，镜像默认支持 Go 程序部署
=======
### Apache

Zabbix on LAMP, the Web Server is Apache  

Apache vhost configuration file: */etc/httpd/conf.d/vhost.conf*    
Apache main configuration file: */etc/httpd/conf/httpd.conf*   
Apache logs file: */var/log/httpd*  
Apache module configuration file: */etc/httpd/conf.modules.d/00-base.conf*    
>>>>>>> 07ead7fdea7c6e2a4c1c43fdc95d2b0273206c64

### Nginx

Zabbix on LEMP, the Web Server is Nginx    

Nginx vhost configuration file: */etc/nginx/sites-available/default.conf*  
Nginx main configuration file: */etc/nginx/nginx.conf*  
Nginx logs file: */var/log/nginx/*

### MYSQL

MySQL installation directory: */usr/local/mysql*  
MySQL data directory: */data/mysql*  
MySQL configuration file: */etc/my.cnf*    
MySQL Web Management URL: *http://Internet IP/phpmyadmin*, [get credential](/stack-accounts.md)

### phpMyAdmin

phpMyAdmin installation directory: */data/apps/phpmyadmin*  
phpMyAdmin configuration file: */data/apps/phpmyadmin/config.inc.php*   
phpMyAdmin vhost configuration file: */etc/httpd/conf.d/phpMyAdmin.conf* or */etc/nginx/php.conf*  

### Redis

Redis configuration file: */etc/redis.conf*  
Redis data directory: */var/lib/redis*  
Redis logs file: */var/log/redis/redis.log*

## Ports

You can control(open or shut down) ports by **[Security Group Setting](https://support.websoft9.com/docs/faq/zh/tech-instance.html)** of your Cloud Server whether the port can be accessed from Internet.

These ports should be opened for this application:

| Name | Number | Use |  Necessity |
| --- | --- | --- | --- |
| MySQL | 3306 | Remote connect MySQL | Optional |
| HTTP | 80 | HTTP requests for Zabbix | Required |
| HTTPS | 443 | HTTPS requests Zabbix | Optional |

## Version

You can see the version from product page of Marketplace. However, after being deployed to your server, the components will be automatically updated, resulting in a certain change in the version number. Therefore, the exact version number should be viewed by running the command on the server:

```shell
<<<<<<< HEAD
# Zabbix version
cd /opt/Zabbix/bin
./Zabbix version
=======
# Linux Version
lsb_release -a
>>>>>>> 07ead7fdea7c6e2a4c1c43fdc95d2b0273206c64

# PHP Version
php -v

# List Installed PHP Modules
php -m

# Apache version on Centos
httpd -v

# Apache version on Ubuntu
apache2 -v

# List Installed Apache Modules
apachectl -M

# Nginx version
nginx -v

# List Installed Nginx Modules
nginx -V

# MySQL version:
mysql -V

# Redis version
redis-server -v
```