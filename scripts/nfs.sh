#!/bin/bash

# Install nfs & enable cache
DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install nfs-common cachefilesd
sed -i 's/#RUN/RUN/' /etc/default/cachefilesd
