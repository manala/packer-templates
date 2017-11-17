#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

# Get debian release (wheezy,jessie,stretch,...)
RELEASE=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

eval "cat > /etc/apt/sources.list << EOF
$(cat ${DIR}/sources/list)
EOF"

apt-get update
