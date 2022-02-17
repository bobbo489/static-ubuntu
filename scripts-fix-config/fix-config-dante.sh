#!/bin/bash

mkdir -p /config/dante \
    && cp -n /testdasi/etc/danted.conf /config/dante/
sed -i "s|port=1080|port=$DANTE_PORT|g" '/config/dante/danted.conf'
echo '[info] danted fixed.'
