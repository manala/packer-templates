#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mDebian - Apt - Setup - Backports\033[0m\n"

# Get debian release (wheezy,jessie,stretch,...)
RELEASE=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

DIR=$(cd $(dirname $0) && pwd)

case ${RELEASE} in
wheezy)
  eval "cat > /etc/apt/sources.list.d/archive_debian_org_debian.list << EOF
deb http://archive.debian.org/debian ${RELEASE}-backports main
EOF"
  ;;
jessie)
  eval "cat > /etc/apt/sources.list.d/archive_debian_org_debian.list << EOF
deb http://archive.debian.org/debian ${RELEASE}-backports main
EOF"
  eval "cat > /etc/apt/apt.conf.d/archive << EOF
Acquire::Check-Valid-Until "false";
EOF"
  ;;
stretch)
  eval "cat > /etc/apt/sources.list.d/deb_debian_org_debian.list << EOF
deb http://deb.debian.org/debian ${RELEASE}-backports main
EOF"
  ;;
esac

apt-get --quiet update
