##!/bin/bash
podman run --net slirp4netns:allow_host_loopback=true -p 8000:80 -it --rm php-apache-alpine:latest