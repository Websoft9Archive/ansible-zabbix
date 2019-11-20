# Update & Upgrade

Updates and upgrades are one of the maintenance tasks for sytem. Programs that are not upgraded for a long time, like buildings that are not maintained for a long time, will accelerate aging and gradually lose functionality until they are unavailable.

You should know the differences between the terms **Update** and **Upgrade**([Extended reading](https://support.websoft9.com/docs/faq/tech-upgrade.html#update-vs-upgrade))
- Operating system patching is **Update**, Ubuntu16.04 to Ubuntu18.04 is **Upgrade**
- MySQL5.6.25 to MySQL5.6.30 is **Update**, MySQL5.6 to MySQL5.7 is **Upgrade**

For Zabbix maintenance, focus on the following two Update & Upgrade jobs

- Sytem update(Operating System and Running Environment) 
- Zabbix upgrade 

## System Update

Run an update command to complete the system update:

``` shell
#For Centos&Redhat
yum update -y

#For Ubuntu&Debian
apt update && apt upgrade -y
```
> This deployment package is preconfigured with a scheduled task for automatic updates. If you want to remove the automatic update, please delete the corresponding Cron

## Zabbix Upgrade

Installing the module 【1-Click Upgrade】for Zabbix upgrading online

1. Log in Zabbix console, open【Modules Catalog】, search the module【upgrade】 and install it
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-upgrade001-websoft9.png)
2. Set it when you have completed the installation of this module
3. Set your Zabbix to [maintenance mode](/solution-more.md#prestashop-maintenance-mode)
4. Click【Upgrade Zabbix now】 to start upgrading
   ![](http://libs.websoft9.com/Websoft9/DocsPicture/en/prestashop/prestashop-checkupgrade-websoft9.png)
5. The latest installation package will be downloaded first during the upgrade. Due to network factors, this process may be slow.
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-upgrade003-websoft9.png)
6. Exceptions to the upgrade process
   - If you can't complete this step to download a new version, you need to try multiple times.
   - May get the error “you don't have permission...ajax-upgradetab.php”

> More upgrade details please refer to: [Zabbix Upgrade](http://doc.prestashop.com/display/PS16/Manual+update)

## Zabbix Module Upgrade

Zabbix can upgrade the Module online

1. Log in Zabbix as administrator, open【Modules Catalog】
2. Find the module you need to upgrade, click the 【Upgrade】 button
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-upgrademodules-websoft9.png)