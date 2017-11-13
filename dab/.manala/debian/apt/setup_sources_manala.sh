#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

DIR=$(cd $(dirname $0) && pwd)

# Get debian release (wheezy,jessie,stretch,...)
RELEASE=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

eval "cat > /etc/apt/sources.list.d/debian_manala_io.list << EOF
$(cat ${DIR}/sources/list_manala)
EOF"

apt-get -y --no-install-recommends install gnupg

apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net 1394DEA3

apt-get update
