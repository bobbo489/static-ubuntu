#!/bin/bash

DNS_PORT=${DNS_SERVER_PORT}
# DoT port is fixed due to TLS protocol
DOT_PORT=853

mkdir -p /config/stubby \
    && cp -n /static-ubuntu/etc/stubby.yml /config/stubby/
sed -i "s|  - 0\.0\.0\.0\@53|  - 0\.0\.0\.0\@$DNS_PORT|g" '/config/stubby/stubby.yml'
echo '[info] stubby fixed.'
