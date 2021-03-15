# 初始化安装

在云服务器上部署 Zabbix 预装包之后，请参考下面的步骤快速入门。

## 准备

1. 在云控制台获取您的 **服务器公网IP地址** 
2. 在云控制台安全组中，检查 **Inbound（入）规则** 下的 **TCP:80** 端口是否开启
3. 若想用域名访问 Zabbix，请先到 **域名控制台** 完成一个域名解析

## Zabbix 安装向导

1. 使用本地电脑的 Chrome 或 Firefox 浏览器访问网址：*http://域名* 或 *http://服务器公网IP*, 进入登录界面
   ![Zabbix 登录界面](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-login-websoft9.png)

2. 输入账号密码后登录到后台（[不知道账号密码？](/zh/stack-accounts.html#mysql)）
   ![](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboard-websoft9.png)

3. 打开用户管理界面，更换所需的语言（如果语言为灰色状态，参考[启用语言方案](/zh/solution-more.md#zabbix-多语言)）
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/en/zabbix/zabbix-changelang-websoft9.png)  
   ![Zabbix 更换语言](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-dashboardzh-websoft9.png)

## Zabbix 入门向导

下面继续上一节，通过连接一个客户端的实际应用场景，帮助用户快速入门。  

1. 使用SSH连接 Zabbix 服务器

2. 获取服务器上 Zabbix-Agent 容器虚拟机的IP（用于演示并监控服务器自身）
   ```
   docker inspect zabbix-agent | grep IPAddress
   ```
   > 若监控其他服务器，需先[安装Zabbix-Agent](/zh/solution-more.md#安装客户端)，然后参数上述步骤

3. 登录到 Zabbix 控制台后， 依次打开：【配置】>【主机】，打开主机列表
   ![Zabbix 添加主机](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-edithost001-websoft9.png)

4. 输入第二步获取的 IP 地址，保存配置
   ![Zabbix 添加主机](https://libs.websoft9.com/Websoft9/DocsPicture/zh/zabbix/zabbix-edithost002-websoft9.png)

5. 回到主机列表页，启用主机监控，当主机【可用性】列变成**绿色**即表明监控已成功

> 需要了解更多 Zabbix 的使用，请参考官方文档：[Zabbix Documentation](https://www.zabbix.com/documentation/current/)

## 常见问题

#### 浏览器无法访问 Zabbix（白屏没有结果）？

您的服务器对应的安全组 80 端口没有开启（入规则），导致浏览器无法访问到服务器的任何内容

#### 端口已经开启，*http://服务器公网IP* 仍然无法访问 Zabbix？

您使用的非容器部署方案，请参考[此处](/zh/stack-installationold.md)

#### 本部署包采用的哪个数据库来存储 Zabbix 数据？

MySQL

#### 是否可以采用云厂商提供的 RDS 来存储 Zabbix 数据？

不建议
