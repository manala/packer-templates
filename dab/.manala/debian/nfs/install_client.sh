#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

printf "[\033[36mManala\033[0m] \033[32mDebian - Nfs - Install client\033[0m\n"

apt-get -y --no-install-recommends install nfs-common cachefilesd

# Enable cachefilesd
sed -i 's/#RUN=yes/RUN=yes/' /etc/default/cachefilesd
