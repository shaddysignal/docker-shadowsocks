FROM rickl/shadowsocks-libev-alpine:latest
MAINTAINER Anon <someone@shaddy.space>

USER root

ARG GIT_OBFS=https://github.com/shadowsocks/simple-obfs.git
ARG OBFS_CONF=--disable-documentation

RUN set -ex && \
       apk add --no-cache --virtual .build-deps-obfs \
                                    gcc \
                                    autoconf \
                                    make \
                                    libtool \
                                    automake \
                                    zlib \
                                    openssl \
                                    asciidoc \
                                    xmlto \
                                    libpcre32 \
                                    libev-dev \
                                    g++ \
                                    linux-headers \
                                    git && \
       cd /tmp && \
       git clone $GIT_OBFS && \
       cd simple-obfs && \
       git submodule update --init --recursive && \
       ./autogen.sh && \
       ./configure $OBFS_CONF && make && \
       make install && \
       cd .. && \
       apk del .build-deps-obfs && \
       rm -rf /tmp/*

ADD entry.sh /usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh

USER nobody

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/entry.sh"]
