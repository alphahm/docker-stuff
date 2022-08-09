FROM debian
MAINTAINER alphahm

ADD compile_php.sh /usr/src/php-7.0.5/compile_php.sh
ADD php-7.0.5.tar.gz /usr/src/
ADD apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN apt-get update && \
apt-get install -y apache2 apache2-dev build-essential libxml2-dev libssl-dev libcurl4-gnutls-dev libpng12-dev libfreetype6-dev && \
cd /usr/src/php-7.0.5 && \
./compile_php.sh && \
apt-get remove -y build-essential && \
apt-get clean && \
apt-get autoremove -y && \
a2enmod rewrite && \
/usr/sbin/service apache2 restart

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
