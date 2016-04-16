#docker
dev environment: PHP 7 + MySQL 5.7
## Dockerfile_php
A debian machine with a compiled version of php 7 and an install of apache2. At the time I wrote the script, I used version 7.0.2.
Archive file can be downloaded from official website:
http://php.net/downloads.php

Put archive in the same directory and update path in Dockerfile_php

## Dockerfile_mysql
An install of mysql on a debian machine using generic binary of mysql 5.7.

Link if newer version can be updated on line 6 (right after wget command)

## docker-compose.yml
Update with correct volume paths for mysql data directory and apache virtualhost directory on host machine.

## mysql_backup.sh
Script to do mysql incremental backup. Will generate a data_backup.sql file and purge logs on the server. Useful (or not) if testing or developping on a second machine not sharing the same data directory. The backup file can be imported by doing:
mysql -u username -p < data_backup on the second machine.
The script was inspired by reading MySQL documentation:
http://dev.mysql.com/doc/refman/5.7/en/point-in-time-recovery.html

