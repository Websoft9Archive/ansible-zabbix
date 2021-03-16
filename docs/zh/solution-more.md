# 更多...

下面每一个方案，都经过实践证明行之有效，希望能够对你有帮助

## 域名绑定

绑定域名的前置条件是：已经完成域名解析（登录域名控制台，增加一个A记录指向服务器公网IP）  

完成域名解析后，从服务器安全和后续维护考量，需要完成**域名绑定**：

Zabbix 域名绑定操作步骤：

1. 使用 SFTP 工具登录云服务器

2. 修改 [虚拟机主机配置文件](/zh/stack-components.md#nginx)，将其中的域名相关的值
   ```text
   server_name    localhost; # 改为自定义域名
   ```
   
3. 保存配置文件，[重启 Nginx 服务](/zh/admin-services.md#nginx)

## 更换数据库

默认部署方案中，采用的是本地安装的 MySQL 数据库。如果您打算更换数据库，请参考如下步骤：

1. 导出 zabbix, zabbix-proxy 数据库

2. 使用 SFTP 连接到服务器，编辑与数据库连接相关的两个文件

   * /data/wwwroot/zabbix/.env_db_mysql_proxy
   * /data/wwwroot/zabbix/.env_db_mysql

3. 分别修改两个文件中的数据库连接信息，保存

4. 重新运行容器后生效
   ```
   cd /data/wwwroot/zabbix
   sudo docker compose up -d
   ```

5. 导入备份数据到新的数据库中

## 多语言

Zabbix 默认已经内置多种语言包，非常方便进行在线切换。

1. 登录到 Zabbix 后台

2. 依次打开：【管理】>【用户】，编辑用户信息管理界面，更换所需的语言
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-changelang-websoft9.png)  
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboardzh-websoft9.png)

> 如果语言为灰色状态,参考官方字符编码安装方案：[How to install locale](https://zabbix.org/wiki/How_to/install_locale)

## 安装客户端

1. 安装 [Zabbix-agent](https://www.zabbix.com/download?zabbix=5.0&os_distribution=centos&os_version=7&db=mysql&ws=apache) 
   ```shell
   rpm -Uvh https://repo.zabbix.com/zabbix/<ZABBIX_VERSION>/rhel/7/x86_64/zabbix-release-<ZABBIX_VERSION>-1.el7.noarch.rpm
   yum install zabbix-agent -y
   ```

2. 配置 /etc/zabbix/zabbix_agentd.conf
   ```
   Server=SERVER_IP   
   ServerActive=SERVER_IP (服务端ip)   
   Hostname=zabbix_web (客户端主机名)   
   ```

## 重置密码

常用的 Zabbix 重置密码相关的操作主要有修改密码和找回密码两种类型：

### 修改密码

1. 登录 Zabbix 后台，依次打开：【管理】>【用户】，编辑目标用户
  ![Zabbix 修改密码](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-modifypw-websoft9.png)

2. 点击【修改密码】

### 找回密码

如果用户忘记了密码，需要通过修改数据库相关字段来重置密码：

1. 登录 [phpMyAdmin](/zh/admin-mysql.md)，进入 Zabbix 数据库

2. 在 SQL 窗口运行重置密码的命令
   ```
   sudo mysql -uroot -p new_password -e "update zabbix.users set passwd=md5(new_password) where alias='Admin';"
   ```
