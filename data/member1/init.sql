CREATE USER 'repl1'@'10.24.16.102' IDENTIFIED BY 'SlavePass' ;
GRANT REPLICATION SLAVE ON *.* TO 'repl1'@'10.24.16.102';
FLUSH PRIVILEGES;

STOP SLAVE;
CHANGE MASTER TO MASTER_HOST='10.24.16.102',MASTER_USER='repl2',MASTER_PASSWORD='SlavePass',MASTER_LOG_FILE='master2-bin.000003',MASTER_LOG_POS=344;
START SLAVE;