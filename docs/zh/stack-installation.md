# 初始化安装

在云服务器上部署 Zabbix 预装包之后，请参考下面的步骤快速入门。

## 准备

1. 在云控制台获取您的 **服务器公网IP地址** 
2. 在云控制台安全组中，检查 **Inbound（入）规则** 下的 **TCP:80** 端口是否开启
3. 若想用域名访问 Zabbix，请先到 **域名控制台** 完成一个域名解析

## Zabbix 安装向导

1. 使用本地电脑的 Chrome 或 Firefox 浏览器访问网址：*http://域名/zabbix* 或 *http://服务器公网IP/zabbix*, 就进入引导首页
   ![开始安装 Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installwel-websoft9.png)

   **如果默认打开就是登陆界面**，请直接查看（[默认账号](/zh/stack-accounts.html#zabbix)） 后登录使用
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-login-websoft9.png)

2. 检测环境是否满足安装要求
   ![安装 Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installcheck-websoft9.png)

3. 安装进入数据库配置界面（[不知道数据库密码？](/zh/stack-accounts.html#mysql)），然后进入下一步
   ![安装 Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installdb-websoft9.png)

4. Zabbix Server 设置（保持默认设置即可）
   ![安装 Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installserver-websoft9.png)

5. 安装前信息确认  
   ![安装 Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installsy-websoft9.png)

6. 安装完成提示信息  
   ![安装 Zabbix](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-installss-websoft9.png)

7. 登录 Zabbix 后台（[默认账号](/zh/stack-accounts.html#zabbix)）  
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-login-websoft9.png)

8. 登录成功，体验后台
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboard-websoft9.png)

9. 进入用户管理界面，更换所需的语言（如果语言为灰色状态，参考[启用语言方案](/zh/solution-more.md#zabbix-多语言)）
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-changelang-websoft9.png)  
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboardzh-websoft9.png)

> 需要了解更多 Zabbix 的使用，请参考官方文档：[Zabbix Documentation](https://www.zabbix.com/documentation/current/)

## 常见问题

#### 浏览器无法访问 Zabbix（白屏没有结果）？

您的服务器对应的安全组80端口没有开启（入规则），导致浏览器无法访问到服务器的任何内容

#### 本部署包采用的哪个数据库来存储 Zabbix 数据？

MariaDB（ MySQL 分支）

#### 是否可以采用云厂商提供的 RDS 来存储 Zabbix 数据？

不建议
