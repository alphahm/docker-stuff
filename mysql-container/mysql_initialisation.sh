#!/usr/bin/env bash

cd /usr/local/mysql
# Users and permissions configuration
groupadd mysql
useradd -r -g mysql -s /bin/false mysql
mkdir mysql-files
chown mysql:mysql mysql-files
chmod 750 mysql-files
mkdir /tmp/mysql
chown -R mysql:mysql /tmp/mysql
chmod -R 771 /tmp/mysql

# mysql server configuration in /etc/my.cnf
echo "[mysqld]\npid-file = /tmp/mysql/mysqld.pid\nlog_error = /tmp/mysql/error.log\nsocket = /tmp/mysql/mysql.sock\nlog-bin = /usr/local/mysql/data/bin-log\nserver-id = 1" > /etc/my.cnf
chown mysql /etc/my.cnf

# Initialisation of mysql with a blank password for root
bin/mysqld --initialize-insecure --user=mysql
chown -R root .
chown -R mysql data mysql-files

# Run mysql server for the first time and execute mysql_initialisation.sql
# used to set up a root password and another user
bin/mysqld_safe --user=mysql &
while ! ./bin/mysqladmin ping --silent
do
    echo 'Waiting for mysql to start!'
    sleep 1
done
bin/mysql -u root --host=127.0.0.1 --socket=/tmp/mysql/mysql.sock <  /root/mysql_initialisation.sql
