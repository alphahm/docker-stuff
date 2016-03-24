#! /bin/bash

./configure \
--with-libdir=/lib/x86_64-linux-gnu \
--with-freetype-dir \
--with-config-file-path=/usr/local/lib/php \
--with-apxs2=/usr/bin/apxs2 \
--disable-short-tags \
--with-openssl \
--with-pcre-regex \
--with-curl \
--with-gd \
--enable-mbstring \
--with-mysqli \
--with-pdo-mysql \
--with-pdo-sqlite \
--enable-soap \
--enable-zip
make
make install
cp php.ini-development /usr/local/lib/php/php.ini
ln -s /usr/local/lib/php/php.ini /etc
rm -rf /usr/src/*
a2dismod mpm_event
a2enmod mpm_prefork
printf '%s\n\t%s\n%s' '<FilesMatch ".+\.ph(p[3457]?|t|tml)$">' 'SetHandler application/x-httpd-php'  '</FilesMatch>' >> /etc/apache2/mods-enabled/php7.load
/usr/sbin/apachectl stop