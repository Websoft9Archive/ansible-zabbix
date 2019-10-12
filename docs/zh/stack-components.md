# 参数

## 组件及路径

Zabbix部署包中不仅仅只有Zabbix本身，还包含一序列支持Zabbix运行所需的其他软件（这里称之为组件），下面列出主要组件名称、安装路径、配置文件地址等重要的信息：

### Zabbix

Zabbix

Zabbix安装目录: /usr/share/zabbix
Zabbix配置文件: /usr/share/zabbix/conf/zabbix.conf.php
Zabbix日志文件目录：/var/log/zabbix/zabbix_agentd.log   /var/log/zabbix/zabbix_server.log

> Zabbix配置文件中包含数据库连接信息，更改了MariaDB数据库账号密码，此处也需要对应修改

### Apache
Apache vhost configuration file: /etc/apache2/sites-available/000-default.conf
Apache configuaration file: /etc/apache2/apache2.conf
Apache logs file: /var/log/apache2

### MariaDB
Database install directory: /usr/share/mysql 
Database data directory: /var/lib/mysql 
Database Configuration /etc/mysql/mariadb.conf.d/50-server.cnf


## 端口号

下面是您在使用本镜像过程中，需要用到的端口号，请通过云控制台安全组进行设置

| 名称 | 端口号 | 用途 |  必要性 |
| --- | --- | --- | --- |
| MariaDB | 3306 | 远程连接MariaDB | 可选 |
| HTTP | 80 | 通过http访问Zabbix | 必须 |
| HTTPS | 443 | 通过https访问Zabbix | 可选 |

## 版本号

组件对应的基本版本号可以通过云市场商品页面查看，但部署到您的服务器之后，版本会有一定的升级，故更为精准的版本请通过在服务器上运行命令查看：

```shell
Apache version:
apache2 -v

MariaDB version:
mysql -V

php:
php -v
```