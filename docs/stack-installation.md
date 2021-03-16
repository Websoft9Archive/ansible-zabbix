# Initial Installation

If you have completed the Zabbix deployment on Cloud Platform, the following steps is for you to start use it quikly

## Preparation

1. Get the **Internet IP** on your Cloud Platform
2. Check you **[Inbound of Security Group Rule](https://support.websoft9.com/docs/faq/tech-instance.html)** of Cloud Console to ensure the TCP:80 is allowed
3. Make a domain resolution on your DNS Console if you want to use domain for Zabbix

## Zabbix Installation Wizard

1. Using local Chrome or Firefox to visit the URL *https://DNS* or *https://Server's Internet IP*, you can access the login page of Zabbix
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-login-websoft9.png)

2. Login to Zabbix console([default username and password](/stack-accounts.md#zabbix))

3. You can see the Zabbix dashboard
   ![Zabbix Dashboard](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboard-websoft9.png)

4. Go to the User profile of Zabbix Administrator, change your language if you want
   ![Zabbix change language](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-changelang-websoft9.png)
   ![Zabbix change language](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboardzh-websoft9.png)

## Zabbix Setup wizard

1. Use SSH to connect Zabbix Server

2. Get the IP installed Zabbix-Agent which for monitor Zabbix-Server itself
   ```
   docker inspect zabbix-agent | grep IPAddress
   ```
   > You should install [Zabbix-Agent](/solution-more.md#install-zabbix-agent) if you want to test it on another Server

3. Login to Zabbix console, open:【Configuration】>【Hosts】 to list all hosts
   ![Zabbix add host](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-edithost001-websoft9.png)

4. Fill the IP in the form and save it
   ![Zabbix add host](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-edithost002-websoft9.png)

5. Return to hosts list page and enable you host. 

6. You can see the green status of Availability if monitor running

> More useful Zabbix guide, please refer to [Zabbix Documentation](https://www.zabbix.com/documentation/current)

## Q&A

#### I can't visit the start page of Zabbix?

Your TCP:80 of Security Group Rules is not allowed so there no response from Chrome or Firefox

#### Port 80 is enabled, but access URL *http://Server Internet IP* still failed?

You maybe use our old deployment solution, refer to[here](/stack-installationold.md)

#### Which database does this Zabbix package use?

MySQL

#### Can I use Cloud database for Zabbix?

Yes
