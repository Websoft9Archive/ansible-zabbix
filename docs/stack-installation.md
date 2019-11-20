# Initial Installation

If you have completed the Zabbix deployment on Cloud Platform, the following steps is for you to start use it quikly

## Preparation

1. Get the **Internet IP** on your Cloud Platform
2. Check you **[Inbound of Security Group Rule](https://support.websoft9.com/docs/faq/tech-instance.html)** of Cloud Console to ensure the TCP:80 is allowed
3. Make a domain resolution on your DNS Console if you want to use domain for Zabbix

## Zabbix Installation Wizard

1. Using local Chrome or Firefox to visit the URL *https://domain/zabbix* or *https://Internet IP/zabbix*, start to install your Zabbix
  ![](http://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/mw05.png)

   ![install Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installwel-websoft9.png)

   **If you can visit login page directly**, please get the Username and Password from [here](/stack-accounts.html#zabbix)
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-login-websoft9.png)

2. Check the environment for installation
   ![install Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installcheck-websoft9.png)

3. Configure the database connection([Don't know password?](/stack-accounts.md#mysql)) and go next step
   ![install Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installdb-websoft9.png)

4. Zabbix Server settings, suggest using default settings
   ![install Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installserver-websoft9.png)

5. Pre-Installation summary  
   ![install Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installsy-websoft9.png)

6. Installation successful    
   ![install Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installss-websoft9.png)

7. Login to Zabbix console([default username and password](/stack-accounts.md#zabbix))
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-login-websoft9.png)

8. Zabbix dashboard
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboard-websoft9.png)

9. Go to the 进入用户管理界面，更换所需的语言（如果语言为灰色状态，参考[启用语言方案](/zh/solution-more.md#zabbix-多语言)） 
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-changelang-websoft9.png)
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboardzh-websoft9.png)

> More useful Zabbix guide, please refer to [Zabbix Documentation](https://www.zabbix.com/documentation/current)

## Q&A

#### I can't visit the start page of Zabbix?

Your TCP:80 of Security Group Rules is not allowed so there no response from Chrome or Firefox

#### Which database does this Zabbix package use?

MariaDB

#### Can I use Cloud database for Zabbix?

No
