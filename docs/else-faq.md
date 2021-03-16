# FAQ

#### Does Zabbix support multi-language?

Yes

#### How does this deployment plan install Zabbix?

Docker

#### Will Docker installation lose data?

Zabbix have mount to volume, and database MySQL is based on non-container deployment

#### What is the default character set?

UTF-8

#### Is Zabbix-Proxy included in this deployment solution?

Yes

#### What components included in this Zabbix deployment solution? 

Zabbix-Server, Zabbix-Web, Zabbix-Proxy, Zabbix-Agent, Zabbix-java-gateway  

#### What's Zabbix-Sender?

Zabbix sender is a command line utility that may be used to send performance data to Zabbix server for processing.

#### What's Zabbix-Git?

Zabbix get is a command line utility which can be used to communicate with Zabbix agent and retrieve required information from the agent.


#### Can I use the RDS of Cloud Provider for Zabbix?

Yes

#### Where is the database connection configuration of Zabbix?

Database configuration information in *LocalSettings.php* in the [Zabbix installation directory](/stack-components.md#zabbix)

#### If there is no domain name, can I deploy Zabbix?

Yes, visit Zabbix by *http://Internet IP*

#### What is the password for the database root user?

The password is stored in the server related file: `/credentials/password.txt`


#### Is it possible to modify the source path of Zabbix?

No

#### Can I configure this Zabbix if I don't understand the Linux command?

Yes, you can use GUI tool WinSCP to start Zabbix, no commands

#### How to change the permissions of filesytem?

Change owner(group) or permissions like below:

```shell

#e.g. user is apache
chown -R apache.apache /data/wwwroot

#e.g. user is nginx
chown -R nginx.nginx /data/wwwroot

#modify the read/modify/excuse permissions

find /data/wwwroot -type d -exec chmod 750 {} \;
find /data/wwwroot -type f -exec chmod 640 {} \;
```

#### What's the difference between Deployment and Installation?

- Deployment is a process of installing and configuring a sequence of software in sequence in a different order, which is a complex system engineering.  
- Installation is the process of starting the initial wizard after the application is prepared.  
- Installation is simpler than deployment. 

#### What's Cloud Platform?

Cloud platform refers to platform manufacturers that provide cloud computing services, such as: **Azure, AWS, Alibaba Cloud, HUAWEI CLOUD, Tencent Cloud**, etc.

#### What is the difference between Instance, Cloud Server, Virtual Machine, ECS, EC2, CVM, and VM?

No difference, just the terminology used by different manufacturers, actually cloud servers