#!/bin/bash

## Install dependencies ##
apt-get -y update \
    && apt-get -y install --no-install-recommends --no-install-suggests libicu66 libmediainfo0v5 sqlite3

## Install sonarr ##
SONARR_BRANCH="main"
SONARR_VERSION=$(curl -sX GET http://services.sonarr.tv/v1/releases | jq -r ".[] | select(.branch==\"${SONARR_BRANCH}\") | .version")
rm -rf /app/sonarr/bin \
    && curl -o /tmp/sonarr.tar.gz -L "https://download.sonarr.tv/v${SONARR_VERSION:0:1}/${SONARR_BRANCH}/${SONARR_VERSION}/Sonarr.${SONARR_BRANCH}.${SONARR_VERSION}.linux.tar.gz" \
    && mkdir -p /app/sonarr/bin \
    && tar xf /tmp/sonarr.tar.gz -C /app/sonarr/bin --strip-components=1 \
    && rm -f /tmp/sonarr.tar.gz

## Set update method and build info ##
echo "UpdateMethod=docker\nBranch=${SONARR_BRANCH}\nPackageVersion=${SONARR_VERSION}\nPackageAuthor=[testdasi](https://github.com/testdasi)" > /app/sonarr/package_info \
    && rm -rf /app/sonarr/bin/Sonarr.Update
echo "$(date "+%d.%m.%Y %T") Added sonarr version ${SONARR_VERSION} from ${SONARR_BRANCH} branch" >> /build_date.info

## Clean up ##
apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
