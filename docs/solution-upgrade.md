# Update & Upgrade

Updates and upgrades are one of the maintenance tasks for sytem. Programs that are not upgraded for a long time, like buildings that are not maintained for a long time, will accelerate aging and gradually lose functionality until they are unavailable.

You should know the differences between the terms **Update** and **Upgrade**([Extended reading](https://support.websoft9.com/docs/faq/tech-upgrade.html#update-vs-upgrade))
- Operating system patching is **Update**, Ubuntu16.04 to Ubuntu18.04 is **Upgrade**
- MySQL5.6.25 to MySQL5.6.30 is **Update**, MySQL5.6 to MySQL5.7 is **Upgrade**

For Zabbix maintenance, focus on the following two Update & Upgrade jobs

- System update(Operating System and Running Environment) 
- Zabbix upgrade 

## System Update

Run an update command to complete the system update:

``` shell
#For Ubuntu&Debian
apt update && apt upgrade -y

#For Centos&Redhat
yum update -y
```
> This deployment package is preconfigured with a scheduled task for automatic updates. If you want to remove the automatic update, please delete the corresponding Cron

## Zabbix Upgrade

You can upgrade Zabbix by Docker very easy

> Please backup all Zabbix data and database before upgrade

1. Use **SSH** to connect Zabbix instance and pull the latest image
   ```
   docker image pull zabbix/zabbix-server-mysql:centos-5.2-latest 
   docker image pull zabbix/zabbix-proxy-mysql:centos-5.2-latest
   docker image pull zabbix/zabbix-web-apache-mysql:centos-5.2-latest
   docker image pull zabbix/zabbix-java-gateway:centos-5.2-latest
   docker image pull zabbix/zabbix-snmptraps:centos-5.2-latest
   ```
2. Run the docker compose file to recreate container
    ```
    cd /data/wwwroot/zabbix
    docker-compose up -d
    ```
3. Login to Zabbix console to check upgrade

More upgrade detail, refer to: [INSTALLATION FROM CONTAINERS](https://www.zabbix.com/documentation/5.0/manual/installation/containers)