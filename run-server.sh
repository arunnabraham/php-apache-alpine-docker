#!/bin/bash
docker stop $(docker container ps --latest --quiet) \
&& docker build -t localhost/php-apache-alpine:latest . \
&& docker run -d -p 8000:80 --rm -it php-fpm-alpine:latest