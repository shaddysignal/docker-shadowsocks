#!/bin/sh

if [ "client" == "$mode" ]; then
   ss-local --plugin obfs-local --plugin-opts ${plugin_opts:-"obfs=http;obfs-host=github.com"} $@
elif [ "server" == "$mode" ]; then
   ss-server --plugin obfs-server --plugin-opts ${plugin_opts:-"obfs=http"} $@
else
   echo "Wrong mode. Choose 'client' or 'server'"
fi
