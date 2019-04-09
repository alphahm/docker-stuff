FROM debian
MAINTAINER alphahm

# add initialisation scripts
ADD mysql /usr/local/mysql
ADD mysql_initialisation.sql /root/mysql_initialisation.sql
ADD mysql_initialisation.sh /root/mysql_initialisation.sh

RUN apt-get update && \
apt-get install --no-install-recommends -y  libaio-dev wget && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
chmod +x /root/mysql_initialisation.sh && \
sync && \
/root/mysql_initialisation.sh

EXPOSE 3306
CMD ["/usr/local/mysql/bin/mysqld_safe", "--user=mysql"]
