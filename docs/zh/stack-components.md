# 参数

Zabbix 预装包包含 Zabbix 运行所需一序列支撑软件（简称为“组件”），下面列出主要组件名称、安装路径、配置文件地址、端口、版本等重要的信息。

> 本自动化部署方案默认安装：Zabbix-Server, Zabbix-Agent, Zabbix-Web 三大组件。

## 路径

### Zabbix

Zabbix 安装目录: */usr/share/zabbix*  
Zabbix 配置文件: */usr/share/zabbix/conf/zabbix.conf.php*    
Zabbix-Agent 日志文件：*/var/log/zabbix/zabbix_agentd.log*     
Zabbix-Server 日志文件：*/var/log/zabbix/zabbix_server.log*  

> Zabbix 配置文件中包含数据库连接信息，更改了 MySQL 数据库账号密码，此处也需要对应修改

### PHP

PHP 配置文件： */etc/php/7.2/apache2/php.ini*  
PHP Modules 配置文件目录： */etc/php/7.2/mods-available*

### Apache

Apache 虚拟主机配置文件：*/etc/apache2/sites-available/000-default.conf*  
Apache 主配置文件：*/etc/apache2/apache2.conf*  
Apache 日志文件：*/var/log/apache2*  
Apache 模块配置目录： */etc/apache2/mods-available*

### MariaDB

MariaDB 安装路径：*/usr/share/mysql*    
MariaDB 数据文件：*/var/lib/mysql*  
MariaDB 配置文件：*/etc/mysql/mariadb.conf.d/50-server.cnf*


## 端口号

在云服务器中，通过 **[安全组设置](https://support.websoft9.com/docs/faq/zh/tech-instance.html)** 来控制（开启或关闭）端口是否可以被外部访问。 

本应用建议开启的端口如下：

| 名称 | 端口号 | 用途 |  必要性 |
| --- | --- | --- | --- |
| HTTP | 80 | 通过 HTTP 访问 Zabbix | 必须 |
| HTTPS | 443 | 通过 HTTPS 访问 Zabbix | 可选 |
| MySQL | 3306 | 远程连接 MariaDB | 可选 |

## 版本号

组件版本号可以通过云市场商品页面查看。但部署到您的服务器之后，组件会自动进行更新导致版本号有一定的变化，故精准的版本号请通过在服务器上运行命令查看：

```shell
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