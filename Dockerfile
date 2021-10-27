FROM php:7.2-fpm-alpine

RUN apk add --update \
    	wget \
		apache2 \
		apache2-proxy \
        php7-dev    \
		$PHPIZE_DEPS \
		freetype-dev \
		git \
		libjpeg-turbo-dev \
		libpng-dev \
		libxml2-dev \
		libzip-dev \
		openssh-client \
		php7-json \
		imagemagick \
		imagemagick-libs \
		imagemagick-dev \
        libmcrypt-dev


RUN wget -P /etc/ssl/certs/ http://curl.haxx.se/ca/cacert.pem && chmod 744 /etc/ssl/certs/cacert.pem


ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/


RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd igbinary xdebug imagick pdo_pgsql pgsql mbstring pdo_mysql bcmath decimal opcache calendar redis sockets zip vips mysqli intl msgpack

COPY ./entrypoint/server-run.sh /usr/local/bin/server-run.sh
COPY ./apache-config/vhost.conf /etc/apache2/conf.d/vhosts/vhost.conf
COPY ./apache-config/httpd.conf /etc/apache2/httpd.conf


RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
&& php composer-setup.php \
&& php -r "unlink('composer-setup.php');" \
&& mv composer.phar /usr/bin/composer \
&& chmod +x /usr/local/bin/server-run.sh \
&& rm /usr/local/bin/install-php-extensions
# && mkdir /var/www/localhost/htdocs/WiSeItCloud \
# && cd /var/www/localhost/htdocs \
# && find . -type d -exec chmod 0755 {} \; \
# && find . -type f -exec chmod 0644 {} \;


# COPY ./app /var/www/localhost/htdocs

WORKDIR /var/www/localhost/htdocs

# COPY ./app ./

CMD ["/usr/local/bin/server-run.sh"]

