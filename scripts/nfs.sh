#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Install nfs & enable cache
apt-get -y --no-install-recommends install nfs-common cachefilesd
sed -i 's/#RUN/RUN/' /etc/default/cachefilesd
