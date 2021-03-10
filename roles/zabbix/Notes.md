## 安装

### 选取包

Zabbix采用官方提供的 deb/rpm 包安装，这个包包含：

* zabbix-server
* zabbix-agent
* apache（默认安装无法启动，可以自行安装）
* php

需自行安装 mysql
可选自行安装 Apache

### 多版本考量

CentOS7 与 CentOS8 有一些差异，项目的元数据库默认已 CentOS8 为参考，CentOS7安装的时候通过when例外处理。  

为了实现main中统一配置，提前设置了软连接，保证不同OS下路径的一致性

### 例外



## 配置

## 随机密码

### 方案一： 直接通过数据库的 md5 后的密码

### 方案二：摘取源码中的密码相关程序，运行后得到密码
```
      - sudo touch /credentials/hashpasswd.php
      - sudo echo "<?php \$options = [ 'cost' => 10, ]; echo password_hash('"$new_password"', PASSWORD_BCRYPT, \$options); ?>" > /credentials/hashpasswd.php
      - pawd=$(/usr/bin/php /credentials/hashpasswd.php)
      - mysql -uroot -p"$new_password" -h localhost -D zabbix -e "update users set passwd='$pawd' where name='Zabbix'"
```
