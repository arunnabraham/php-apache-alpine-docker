#!/bin/bash
# podman run --net slirp4netns:allow_host_loopback=true -p 8000:80 -it --rm php-apache-alpine:latest
podman run -d --net slirp4netns:allow_host_loopback=true --name webapp1 -p 8000:80 -p 4433:443 -v /home/neoxenos/work/wisilica:/var/www/localhost/htdocs:z -it --rm php-apache-alpine:latest