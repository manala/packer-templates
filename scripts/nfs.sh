#!/bin/bash

# Install nfs & enable cache
DEBIAN_FRONTEND=noninteractive apt-get -y install nfs-common cachefilesd
sed -i 's/#RUN/RUN/' /etc/default/cachefilesd
