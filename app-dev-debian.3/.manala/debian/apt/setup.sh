#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mDebian - Apt - Setup\033[0m\n"

export DEBIAN_FRONTEND=noninteractive

# Get debian release (wheezy,jessie,stretch,...)
RELEASE=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

DIR=$(cd $(dirname $0) && pwd)

eval "cat > /etc/apt/sources.list << EOF
$(cat ${DIR}/sources/list)
EOF"

apt-get --quiet update

case ${RELEASE} in
wheezy|jessie)
  apt-get --quiet --verbose-versions --yes --no-install-recommends install apt-utils apt-transport-https gnupg
  ;;
stretch)
  apt-get --quiet --verbose-versions --yes --no-install-recommends install apt-utils apt-transport-https gnupg dirmngr
  ;;
esac
