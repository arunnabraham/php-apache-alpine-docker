#!/bin/sh
php-fpm --daemonize && httpd -g 'daemon off;'