# 故障处理

此处收集使用 Zabbix 过程中最常见的故障，供您参考

> 大部分故障与云平台密切相关，如果你可以确认故障的原因是云平台造成的，请参考[云平台文档](https://support.websoft9.com/docs/faq/zh/tech-instance.html)

#### 修改了数据库密码 Zabbix 不能访问？

若已完成 Zabbix 安装向导，再通过 phpMyAdmin 修改数据库密码，Zabbix 就会连不上数据库。  

1. 使用 SFTP 连接服务器，修改两个 [Zabbix 数据库配置](/zh/stack-components.md#zabbix) 文件中的密码。  

2. 重新运行容器
   ```
   cd /data/wwwroot/zabbix
   sudo docker compose up -d
   ```
#### Zabbix-server 服务无法启动？

运行 `sudo docker logs zabbix-server` 查询运行日志。  

#### 数据库服务无法启动

数据库服务无法启动最常见的问题包括：磁盘空间不足，内存不足，配置文件错误。  
建议先通过命令进行排查  

```shell
# 查看磁盘空间
df -lh

# 查看内存使用
free -lh

# 查看服务状态和日志
sudo systemctl status mysql
sudo journalctl -u mysql
```

