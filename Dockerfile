FROM debian:buster-slim

RUN apt update && \
    apt -y install build-essential nano net-tools autoconf && \
    apt -y install wget libxml++2.6-dev libfcgi-dev libfcgi0ldbl libjpeg-dev libjpeg62-turbo-dev   libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev libzip-dev libsqlite3-dev libonig-dev && \
    ln -s /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/libc-client.a && \
    cd /usr/include/ && \
    ln -s x86_64-linux-gnu/curl && \
    cd /tmp && \
    wget https://www.php.net/distributions/php-7.4.0.tar.gz && \
    tar xfz php-7.4.0.tar.gz && \
    cd php-7.4.0 && \
    ./configure --prefix=/opt/php-7.4 --with-pdo-pgsql --with-zlib-dir --with-freetype --enable-mbstring --enable-soap --enable-calendar --with-curl --with-zlib --enable-gd --with-pgsql --disable-rpath --enable-inline-optimization --with-bz2 --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex --enable-exif --enable-bcmath --with-mhash --with-zip --with-pdo-mysql --with-mysqli --with-mysql-sock=/var/run/mysqld/mysqld.sock --with-jpeg --with-openssl --with-fpm-user=www-data --with-fpm-group=www-data --with-libdir=/lib/x86_64-linux-gnu --enable-ftp --with-imap --with-imap-ssl --with-kerberos --with-gettext --with-xmlrpc --with-xsl --enable-opcache --enable-intl --with-pear --enable-fpm && \
    make && \
    make install  && \ 
    mkdir -p /var/www/html

EXPOSE 9003
ENTRYPOINT /usr/sbin/php-fpm --nodaemonize




