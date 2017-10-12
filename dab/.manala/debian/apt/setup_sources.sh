#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

# Get debian release (wheezy,jessie,stretch,...)
RELEASE=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

printf "[\033[36mManala\033[0m] \033[32mDebian - Apt - Setup sources\033[0m\n"

eval "cat > /etc/apt/sources.list << EOF
$(cat ${DIR}/sources/list)
EOF"
