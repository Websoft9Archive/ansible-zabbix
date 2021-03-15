# 更新升级

网站技术日新月异，**更新升级**是维护工作之一，长时间不升级的程序，就如长时间不维护的建筑物一样，会加速老化、功能逐渐缺失直至无法使用。  

这里注意更新与升级这两词的差异（[延伸阅读](https://support.websoft9.com/docs/faq/zh/tech-upgrade.html#更新-vs-升级)），例如：  

- 操作系统打个补丁常称之为**更新**，Ubuntu16.04 变更为 Ubuntu18.04，称之为**升级**
- MySQL5.6.25-->MySQL5.6.30 常称之为**更新**，MySQL5.6->MySQL5.7 称之为**升级**

Zabbix 完整的更新升级包括：系统级更新（操作系统和运行环境）和 Zabbix 程序升级两种类型

## 系统级更新

运行一条更新命令，即可完成系统级更新：

``` shell
#For Ubuntu&Debian
apt update && apt upgrade -y

#For Centos&Redhat
yum update -y
```
> 本部署包已预配置一个用于自动更新的计划任务。如果希望去掉自动更新，请删除对应的Cron

## Zabbix 升级

Zabbix 升级原理非常简单：先拉取最新版本的 Zabbix 镜像，然后重新运行容器。

> Zabbix 升级之前请完成服务器的快照备份，以防不测。

1. 使用 SSH 登录 Zabbix 服务器后，拉取最新版本镜像
   ```
   docker image pull zabbix/zabbix-server-mysql:centos-5.2-latest 
   docker image pull zabbix/zabbix-proxy-mysql:centos-5.2-latest
   docker image pull zabbix/zabbix-web-apache-mysql:centos-5.2-latest
   docker image pull zabbix/zabbix-java-gateway:centos-5.2-latest
   docker image pull zabbix/zabbix-snmptraps:centos-5.2-latest
   ```
2. 重新运行 docker-compose 编排文件，启用新的容器
    ```
    cd /data/wwwroot/zabbix
    docker-compose up -d
    ```
3. 登录 Zabbix 后台查看升级后的版本

与升级有关的详细配置方案，请参考官方文档：[INSTALLATION FROM CONTAINERS](https://www.zabbix.com/documentation/5.0/manual/installation/containers)