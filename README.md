# php-apache-alpine-docker
Setups for PHP Apache Alpine in Docker


# Connecting other Host apps

Connect to <host.docker.internal> (docker)

Podman Run with container to host communication

podman run --net slirp4netns:allow_host_loopback=true -p 8000:80 -it --rm php-apache-alpine:latest

the loopback id 

Connect to <host.containers.internal> (podman)