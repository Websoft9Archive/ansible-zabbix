# More

Each of the following solutions has been proven to be effective and we hope to be helpful to you.

## Domain binding

The precondition for **Domain binding** is have completed the **Domain resolution** for Zabbix Instance.

From the perspective of server security and subsequent maintenance considerations, the **Domain Binding** step cannot be omitted.

Zabbix domain name binding steps:

1. Connect your Cloud Server

2. Modify [vhost configuration file](/stack-components.md#nginx), change the domain name item for you
   ```text
    server_name    localhost; # modify to your domain
   ```
3. Save it and restart [Nginx service](/admin-services.md#nginx)


## Zabbix language

1. Login to Zabbix Console

2. Go to the User profile of Zabbix Administrator, change your language if you want
   ![Zabbix change language](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-changelang-websoft9.png)

> If you can't select language, refer to [https://zabbix.org/wiki/How_to/install_locale](https://zabbix.org/wiki/How_to/install_locale)

## Install Zabbix-Agent

1. Install [Zabbix-agent](https://www.zabbix.com/download?zabbix=5.0&os_distribution=centos&os_version=7&db=mysql&ws=apache) 
   ```shell
   rpm -Uvh https://repo.zabbix.com/zabbix/<ZABBIX_VERSION>/rhel/7/x86_64/zabbix-release-<ZABBIX_VERSION>-1.el7.noarch.rpm
   yum install zabbix-agent -y
   ```

2. Configure it by the file: */etc/zabbix/zabbix_agentd.conf*
   ```
   Server=SERVER_IP   
   ServerActive=SERVER_IP 
   Hostname=zabbix_web
   ```

## Replace database

This deployment solution is used the MySQL installed in local, if you want to use other database, refer to:

1. Export database  **zabbix, zabbix-proxy** by phpMyAmin

2. Use **SFTP** to connect Zabbix instance and edit the database configuration file

   * /data/wwwroot/zabbix/.env_db_mysql_proxy
   * /data/wwwroot/zabbix/.env_db_mysql

3. Recreate container 
   ```
   cd /data/wwwroot/zabbix
   sudo docker compose up -d
   ```

5. Import database  


## Resetting Password

There are two main measures to reset password.

### Changing password

Take the steps below:

1. Login to Zabbix console, go to: 【Administrator】>【Users】, edit the target user
  ![Zabbix modify password](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-modifypw-websoft9.png)

2. Click 【Change Password】

### Forgot Password

Try to retrieve your password through database modification when forgot it.  

Follow the steps below:

1. Login [phpMyAdmin](/zh/admin-mysql.md) and open Zabbix database

2. Run the SQL command to reset your password
   ```
   sudo mysql -uroot -p new_password -e "update zabbix.users set passwd=md5(new_password) where alias='Admin';"
   ```