#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get -y --no-install-recommends install nfs-common cachefilesd

# Enable cachefilesd
sed -i 's/#RUN/RUN/' /etc/default/cachefilesd
