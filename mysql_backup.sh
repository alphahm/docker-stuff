#!/bin/bash

# do our configuration here
export MYSQL_PWD="password" # replace by mysql password here
file="data/data_backup.sql" # the final sql file
index="data/bin-log.index"  # binary log index file in mysql folder

# Go to mysql folder
cd /usr/local/mysql

# Remove the final sql file if exists and (re)create it
if [ -f $file ] ; then
    rm $file
fi
touch $file

# Let's have a look at the bin-log index
while read line
do
    echo $line # debugging stuff
    ./bin/mysqlbinlog $line >> $file
done < $index

# Purge binary logs as they might take space
# start mysql
./bin/mysqld_safe --user=mysql  > /dev/null 2>&1 &
while ! ./bin/mysqladmin ping --silent
do
    echo 'Waiting for mysql to start!'
    sleep 1
done

echo 'Purging logs'
./bin/mysql -e "purge binary logs before now();"
echo 'Shutting down mysql'
./bin/mysqladmin shutdown
