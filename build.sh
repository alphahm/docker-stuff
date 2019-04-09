#!/usr/bin/env bash

# MySQL Container
cd mysql-container
if [ ! -d mysql ]; then
	mkdir mysql
else
	rm -rf mysql/*
fi
echo "Downloading mysql binaries and extracting"
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.15-linux-glibc2.12-x86_64.tar.xz -qO - | tar -xJ -C mysql --strip-components=1
