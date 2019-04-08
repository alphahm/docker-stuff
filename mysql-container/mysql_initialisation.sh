#! /bin/bash

cd /usr/local

# get the files, this is here where we need to update the paths in case there is a newer
# version available. There is one tar.gz inside the tar file provided by Oracle which
# contains the binaries, libs... the other tar.gz is the test archive which we're not taking
mkdir mysql
wget http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.11-linux-glibc2.5\-x86_64.tar -O -| tar xOf - mysql-5.7.11-linux-glibc2.5-x86_64.tar.gz | tar xzf - -C mysql --strip-components=1

# Users and permissions configuration
groupadd mysql
useradd -r -g mysql -s /bin/false mysql
cd mysql
mkdir mysql-files
chmod 770 mysql-files
chown -R mysql:mysql .
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
