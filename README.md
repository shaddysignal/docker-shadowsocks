docker-shadowsocks
==================

[![Docker Pulls](https://img.shields.io/docker/pulls/shaddysignal/docker-shadowsocks.svg)](https://hub.docker.com/r/shaddysignal/docker-shadowsocks/)

This Dockerfile builds an image with [shadowsocks](https://github.com/shadowsocks/shadowsocks). Based on rickl/shadowsocks-libev-alpine:latest image. Also, inside there is compiled simple-obfs plugin.

Quick Start
-----------

This image uses ENTRYPOINT to run the containers as an executable.
```bash
    docker run -d -p 1984:1984 --name socks --env mode=server shaddysignal/docker-shadowsocks -s 0.0.0.0 -p 1984 -k $SSPASSWORD -m chacha20-ietf-poly1305
```
You can configure the service to run on a port of your choice. Just make sure the port number given to Docker is the same as the one given to shadowsocks. Also, it is  highly recommended that you store the shadowsocks password in an environment variable as shown above. This way the password will not show in plain text when you run `docker ps`.

or
```bash
   docker run -d -p 1984:1984 --name socks-client --env mode=client shaddysignal/docker-shadowsocks -s server_ip -p server_port -b 0.0.0.0 -l 1984 -k $SSPASSWORD -m chacha20-ietf-poly1305
```
for client mode.

Also there enviroment variable `plugin_opts` that can be passed to either modes for simple-obfs plugin. Default for server is "obfs=http", default for client is "obfs=http;obfs-host=github.com". About what can be set as plugin options can be read in documentation.

For more command line options, refer to the [shadowsocks documentation](https://github.com/shadowsocks/shadowsocks/tree/master) and [shadowsocks simple-obfs plugin documentation](https://github.com/shadowsocks/simple-obfs)
