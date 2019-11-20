# More

Each of the following solutions has been proven to be effective and we hope to be helpful to you.

## Domain binding

The precondition for **Domain binding** is have completed the **Domain resolution** for Zabbix Instance.

From the perspective of server security and subsequent maintenance considerations, the **Domain Binding** step cannot be omitted.

Zabbix domain name binding steps:

1. Connect your Cloud Server
2. Modify [vhost configuration file](/stack-components.md#apache), change the domain name item for you
   ```text
   #### Zabbix (LAMP) bind domain #### 

     <VirtualHost *:80>
     ServerName prestaShop.mydomain.com # modify it for you
     DocumentRoot "/data/wwwroot/Zabbix"
     ...
     
   #### Zabbix (LEMP) bind domain #### 

     server {
      listen 80;
      server_name    prestaShop.example.com; # modify it for you
     ...

   ```
3. Save it and restart [Web Service](/admin-services.md#apache)


## Zabbix Maintenance mode

Log in Zabbix console, open:【Shop Parameters】>【General】>【Maintenance】
![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-mantmode-websoft9.png)


## Zabbix change domain

If you want to change domain for Zabbix, these steps you need to do:

1. Completed domain resolution and domain binding
2. Enable Zabbix's Maintenance mode
3. Edit the Zabbix's configuration file([path](/stack-components.html#prestashop)), modify the domain
4. Log in Zabbix console, open:【Shop Parameters】>【Traffic&SEO】, modify the shop URL
  ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-seturl-websoft9.png)

## Zabbix import

Log in Zabbix console, open:【Advanced Parameters】>【Import】
![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-importdb-websoft9.png)

## Zabbix Modules

Modules is a very import function for Zabbix to extend the business requirement

1. Log in Zabbix console,
2. Open:【Modules】>【Module Catalog】, find the module you want to install and click the【Install】button
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-installmd-websoft9.png)
3. Open:【Modules】>【Module Manager】, find the module you want to upgrade and click the【Upgrade】button
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-upgrademodules-websoft9.png)

## Zabbix connect Marketplace

Completed installation of Zabbix, suggest you make your Zabbix system connect Zabbix's Marketplace. Once you have connected it, you can use many resourses on Marketplace. Refer to [Connect Marketplace](/stack-installation.html#connect-prestashop-marketplace)

## Zabbix language

Zabbix's multi-language support is very mature. The system has a multi-language system built in the background. You only need to select the corresponding language and import it online to your Zabbix system.

### Import language

1. Log in Zabbix console, open:【International】>【Localization】>【language】, enter the interface of language settings
   ![](http://libs.websoft9.com/Websoft9/DocsPicture/en/prestashop/prestashop-local-websoft9.png)
2. Select the language you want to use and click【import】 icon to import online
3. Click 【language】 tab, you can see all language packages been installed successfully
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/en/prestashop/prestashop-alllanguage-websoft9.png) 

> When add new language for Zabbix, it will add redirects rules in the  `.htaccess` file of Zabbix root directory.

### Delete language

1. Log in Zabbix console, open:【International】>【Localization】>【language】,edit your language
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/en/prestashop/prestashop-dellanguage001-websoft9.png)
2. Set the Status to 【No】
3. Click 【language】 tab, you can delete the language you have disabled
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/prestashop/prestashop-dellanguage002-websoft9.png)

## Zabbix API (Web Service)

Zabbix enables merchants to give third-party tools access to their shop's database through a CRUD API, otherwise called a web service.

Refer to official docs: [Zabbix API](https://doc.prestashop.com/display/PS16/Using+the+Zabbix+Web+Service)