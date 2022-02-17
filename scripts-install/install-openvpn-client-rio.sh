#!/bin/bash

## Make copy of static folder ##
cp -rf /testdasi /static-ubuntu

# Selectively delete redundant files #
rm -Rf /static-ubuntu/deprecated

# wipe openvpn etc config #
rm -Rf /etc/openvpn

# dup mono binary #
cp /usr/bin/mono /usr/bin/mono-sonarr \
    && chmod +x /usr/bin/mono-sonarr

# dup python3 binary #
cp /usr/bin/python3 /usr/bin/python3-launcher \
    && chmod +x /usr/bin/python3-launcher

# dup python2 binary #
cp /usr/bin/python2 /usr/bin/python2-launcher \
    && chmod +x /usr/bin/python2-launcher

# chmod scripts #
chmod +x /app/radarr/Radarr
chmod +x /app/prowlarr/Prowlarr
chmod +x /*.sh
chmod +x /static-ubuntu/scripts-debug/*.sh
chmod +x /static-ubuntu/scripts-fix/*.sh
chmod +x /static-ubuntu/scripts-install/*.sh
chmod +x /static-ubuntu/scripts-openvpn/*.sh
