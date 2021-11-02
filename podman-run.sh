#!/bin/bash
# podman run --net slirp4netns:allow_host_loopback=true -p 8000:80 -it --rm php-apache-alpine:latest
# --add-host localhost:10.0.2.2
podman run -d --net slirp4netns:allow_host_loopback=true --name webapp1 -p 8000:80 -p 4433:443 -v /home/neoxenos/work/wisilica:/var/www/localhost/htdocs:z -v ./php-config/php.ini:/usr/local/etc/php/conf.d/custom.ini:z  -it --rm php-apache-alpine:latest
