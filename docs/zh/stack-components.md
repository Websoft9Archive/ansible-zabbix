# 参数

Zabbix 预装包包含 Zabbix 运行所需一序列支撑软件（简称为“组件”），下面列出主要组件名称、安装路径、配置文件地址、端口、版本等重要的信息。

> 本自动化部署方案默认安装：Zabbix-Server, Zabbix-Agent, Zabbix-Web, Zabbix-snmptraps, Zabbix-java-gateway 等组件。

## 路径

### Zabbix

本部署方案中的 Zabbix 采用 Docker部署以适应云原生时代。运行 `docker ps` 查看运行的容器。

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

Zabbix 安装目录: */data/zabbix*  
Zabbix 配置文件（环境变量）: */data/zabbix/.env.xxx*    
Docker Compose 配置文件：*/data/wwwroot/zabbix/docker-compose.yml*     
Zabbix 持久存储：*/data/wwwroot/zabbix/zbx_env  
Zabbix-Web 数据库配置：*/data/wwwroot/zabbix/.env_db_mysql*  
Zabbix-Proxy 数据库配置：*/data/wwwroot/zabbix/.env_db_mysql_proxy*   


> Zabbix 配置文件中包含数据库连接信息，更改了 MySQL 数据库账号密码，此处也需要对应修改

### MySQL

MySQL 安装路径: */usr/local/mysql*  
MySQL 数据文件 */data/mysql*  
MySQL 配置文件: */etc/my.cnf*  

MySQL 可视化管理参考 [MySQL 管理](/zh/admin-mysql.md) 章节。

### phpMyAdmin

phpMyAdmin 是一款可视化 MySQL 管理工具，在本项目中它基于 Docker 安装。  

phpMyAdmin directory：*/data/apps/phpmyadmin*  
phpMyAdmin docker compose file：*/data/apps/phpmyadmin/docker-compose.yml*  

### Nginx

Nginx 虚拟主机配置文件：*/etc/nginx/conf.d/default.conf*  
Nginx 主配置文件： */etc/nginx/nginx.conf*  
Nginx 日志文件： */var/log/nginx*  
Nginx 伪静态规则目录： */etc/nginx/conf.d/rewrite*  

### Docker

Docker 根目录: */var/lib/docker*  
Docker 镜像目录: */var/lib/docker/image*   
Docker daemon.json 文件：默认没有创建，请到 */etc/docker* 目录下根据需要自行创建   

## 端口号

在云服务器中，通过 **[安全组设置](https://support.websoft9.com/docs/faq/zh/tech-instance.html)** 来控制（开启或关闭）端口是否可以被外部访问。 

通过命令`netstat -tunlp` 看查看相关端口，下面列出可能要用到的端口：

| 名称 | 端口号 | 用途 |  必要性 |
| --- | --- | --- | --- |
| HTTP | 80 | 通过 HTTP 访问 Zabbix | 必须 |
| HTTP | 9006 | 通过端口访问 Zabbix  | 可选 |
| HTTPS | 443 | 通过 HTTPS 访问 Zabbix | 可选 |
| MySQL | 3306 | 远程连接 MySQL | 可选 |


## 版本号

组件版本号可以通过云市场商品页面查看。但部署到您的服务器之后，组件会自动进行更新导致版本号有一定的变化，故精准的版本号请通过在服务器上运行命令查看：

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