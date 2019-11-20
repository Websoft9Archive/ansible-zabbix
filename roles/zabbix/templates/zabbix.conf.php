<?php                                                                                                                     
// Zabbix GUI configuration file.                                                                                         
global $DB;                                                                                                               
                                                                                                                          
$DB['TYPE']     = 'MYSQL';           闲                 存  用                                                            
$DB['SERVER']   = 'localhost';                          存                                                                
$DB['PORT']     = '0';                                                                                                    
$DB['DATABASE'] = 'zabbix';                                                                                               
$DB['USER']     = 'zabbix';                                                                                               
$DB['PASSWORD'] = '{{mysql_password}}';                                                                                           
                                                                                                                          
// Schema name. Used for IBM DB2 and PostgreSQL.                                                                          
$DB['SCHEMA'] = '';                                                                                                       
                                                                                                                          
$ZBX_SERVER      = 'localhost';                                                                                           
$ZBX_SERVER_PORT = '10051';                                                                                               
$ZBX_SERVER_NAME = 'zabbix';                                                                                              
                                                                                                                          
$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;  