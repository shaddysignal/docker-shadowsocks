FROM python:alpine
MAINTAINER Anon <someone@shaddy.space>

RUN pip install shadowsocks

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ssserver"]
