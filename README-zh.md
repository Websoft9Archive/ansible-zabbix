# Zabbix 自动化安装与部署

本项目是由 [Websoft9](http://www.websoft9.com) 研发的 [Zabbix](https://www.zabbix.com/download) 自动化安装程序，开发语言是 Ansible。使用本项目，只需要用户在 Linux 上运行一条命令，即可自动化安装 Zabbix，让原本复杂的安装过程变得没有任何技术门槛。  

本项目是开源项目，采用 LGPL3.0 开源协议。

## 配置要求

安装本项目，确保符合如下的条件：

| 条件       | 详情       | 备注  |
| ------------ | ------------ | ----- |
| 操作系统       | CentOS7.x, Ubuntu18.04       |   |
| 公有云| AWS, Azure, 阿里云, 华为云, 腾讯云 | 可选 |
| 私有云|  KVM, VMware, VirtualBox, OpenStack | 可选 |
| 服务器配置 | 最低1核1G，安装时所需的带宽不低于10M |  建议采用按量100M带宽 |

更多查看官方网站 [安装要求](https://www.zabbix.com/documentation/4.0/zh/manual/installation/requirements)

## 组件

包含的核心组件为：Zabbix + Nginx + MariaDB + PHP

更多请见[参数表](/docs/zh/stack-components.md)

## 本项目安装的是 Zabbix 最新版吗？

本项目采用官方提供的 Zabbix 二进制安装包安装方式（适合于生产环境），不同的 Zabbix 版本的下载地址不一样，通过修改 [zabbix_meta](/roles/zabbix/defaults/main.yml) 变量中的 release 维护最新小版本的更新。同时不定期检查 zabbix_meta 否匹配[官方最新的安装地址](https://www.zabbix.com/download)。

```
zabbix_meta:
  "5.0":
    release: "5.0-1"
```

## 安装指南

以 root 用户登录 Linux，运行下面的**命令脚本**即可启动自动化部署，然后耐心等待，直至安装成功。

```
wget -N https://raw.githubusercontent.com/Websoft9/ansible-linux/main/scripts/install.sh; bash install.sh -r zabbix
```  

注意：  

1. 如果以非 root 用户身份登录 Linux，请先通过 sudo 或 su 提升权限，再运行脚本。
2. 由于自动化安装过程中有大量下载任务，若网络不通（或速度太慢）会引起下载失败，从而导致安装程序终止运行。此时，请重置服务器后再次尝试安装，若仍然无法完成，请使用我们在公有云上发布的 [Zabbix 镜像](https://apps.websoft9.com/zabbix) 的部署方式

## License

[LGPL-3.0](/License.md), Additional Terms: It is not allowed to publish free or paid image based on this repository in any Cloud platform's Marketplace.
Copyright (c) 2016-present, Websoft9

## 文档

文档链接：https://support.websoft9.com/docs/zabbix/zh

## FAQ

- 命令脚本部署与镜像部署有什么区别？请参考[镜像部署-vs-脚本部署](https://support.websoft9.com/docs/faq/zh/bz-product.html#镜像部署-vs-脚本部署)
- 本项目支持在 Ansible Tower 上运行吗？支持
