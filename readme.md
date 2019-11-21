# Zabbix 自动化安装与部署

本项目是由 [Websoft9](http://www.websoft9.com) 研发的 [Zabbix](https://about.zabbix.com/) 自动化安装程序，开发语言是 Ansible。使用本项目，只需要用户在 Linux 上运行一条命令，即可自动化安装 Zabbix，让原本复杂的安装过程变得没有任何技术门槛。  

本项目是开源项目，采用 LGPL3.0 开源协议。

## 配置要求

操作系统：目支持 Ubuntu18.x 部署此脚本  
硬件配置：最低1核1G，40G系统盘空间，否则无法运行

更多查看官方网站 [安装要求](https://www.zabbix.com/documentation/4.0/zh/manual/installation/requirements)

## 组件

包含的核心组件为：Zabbix, Apache, MariaDB, PHP

更多请见[参数表](/docs/zh/stack-components.md)

## 本项目安装的是 Zabbix 最新版吗？

本项目采用官方提供的 Zabbix 二进制安装包安装方式（适合于生产环境），不同的 Zabbix 版本的下载地址不一样，因此需要不定期以修改`/roles/zabbix/tasks/ubuntu.yml`文件中对应的下载地址以保证为最新版本

```
    # 添加apt源
    - name: Dwonload zabbix.deb-LTS for ubuntu
      get_url:
        url: https://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-2+bionic_all.deb
        dest: ~/zabbix.deb
      when: version=='LTS'

    - name: Dwonload zabbix.deb-latest for ubuntu
      get_url:
        url: https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb
        dest: ~/zabbix.deb
      when: version=='latest'
```

本项目默认安装 LTS 版本，安装 latest 版本请通过 ansible 变量控制：`version=latest`  

最新版本以及下载地址请查看官方[Download 页面](https://www.zabbix.com/download)

## 安装指南

以 root 用户登录 Linux，运行下面的**命令脚本**即可启动自动化部署，然后耐心等待，直至安装成功。

```
wget https://raw.githubusercontent.com/Websoft9/linux/master/ansible_script/install.py ; python install.py zabbix https://github.com/Websoft9/ansible-zabbix.git
```  

注意：  

1. 如果以非 root 用户身份登录 Linux，请先通过 sudo 或 su 提升权限，再运行脚本。
2. 由于自动化安装过程中有大量下载任务，若网络不通（或速度太慢）会引起下载失败，从而导致安装程序终止运行。此时，请重置服务器后再次尝试安装，若仍然无法完成，请使用我们在公有云上发布的 [Zabbix 镜像](https://apps.websoft9.com/zabbix) 的部署方式


## 文档

文档链接：https://support.websoft9.com/docs/zabbix

## FAQ

- 命令脚本部署与镜像部署有什么区别？请参考[镜像部署-vs-脚本部署](https://support.websoft9.com/docs/faq/zh/bz-product.html#镜像部署-vs-脚本部署)
- 本项目支持在 Ansible Tower 上运行吗？支持
