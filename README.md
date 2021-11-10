# php-apache-alpine-docker
Setups for PHP Apache Alpine in Docker


# Connecting other Host apps

Connect to <host.docker.internal> (docker)

Podman Run with container to host communication

podman run --net slirp4netns:allow_host_loopback=true -p 8000:80 -it --rm php-apache-alpine:latest

the loopback adress to host

Connect to <host.containers.internal> (podman)
Connect to <host.docker.internal> (Docker)


Ideal Run command for volume bidirectional with allowing host networking (For dev only)

Example:

`podman run \`
`-d --net slirp4netns:allow_host_loopback=true \`
`--name webapp1 \`
`-p 8000:80 \`
`-p 4433:443 \`
`-v /app:/var/www/localhost/htdocs:z \`
`-v /php-config/php.ini:/usr/local/etc/php/conf.d/custom.ini:z  \`
`-it --rm php-apache-alpine:latest`
