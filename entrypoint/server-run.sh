#!/bin/sh
php-fpm --daemonize && httpd -k start