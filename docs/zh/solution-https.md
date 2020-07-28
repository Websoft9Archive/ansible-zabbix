# SSL/HTTPS

网站完成**域名绑定**且可以通过 HTTP 访问之后，方可设置 HTTPS。

Zabbix 预装包，已安装Web服务器 SSL 模块和公共免费证书方案 [Let's Encrypt](https://letsencrypt.org/) ，并完成预配置。

> 除了虚拟主机配置文件之外，HTTPS设置无需修改其他文件

## 配置方案

### 自动部署

如果没有申请证书，只需在服务器中运行一条命令`sudo certbot`便可以启动免费证书**自动**申请和部署

```
sudo certbot
```

### 手动部署

如果你已经申请了商业证书，只需三个步骤，即可完成HTTPS配置

以 Zabbix on Ubuntu 为例：

1. 将申请的证书、 证书链文件和秘钥文件上传到 */data/cert* 目录
2. 打开 SSL 配置文件： */etc/apache2/sites-available/default-ssl.conf* 
3. 修改其中的**证书和证书**秘钥文件地址
   ``` text
   SSLCertificateFile	/etc/ssl/certs/ssl-cert-snakeoil.pem
	SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
   ```
4. 保存， [重启 Apache 服务](/admin-services.md#apache)

## 专题指南

若参考上面的**配置方案**仍无法成功设置 HTTPS 访问，请阅读由 Websoft9 提供的 [《HTTPS 专题指南》](https://support.websoft9.com/docs/faq/zh/tech-https.html#nginx)

HTTPS专题指南方案包括：HTTPS 前置条件、HTTPS 配置段模板、注意事项、详细步骤以及故障诊断等具体方案。