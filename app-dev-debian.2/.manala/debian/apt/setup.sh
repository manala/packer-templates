#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mDebian - Apt - Setup\033[0m\n"

export DEBIAN_FRONTEND=noninteractive

# Get debian release (wheezy,jessie,stretch,...)
RELEASE=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

DIR=$(cd $(dirname $0) && pwd)

case ${RELEASE} in
wheezy)
  eval "cat > /etc/apt/sources.list << EOF
deb http://archive.debian.org/debian ${RELEASE} main
deb http://archive.debian.org/debian-security ${RELEASE}/updates main
EOF"
  eval "cat > /etc/apt/apt.conf.d/archive << EOF
Acquire::Check-Valid-Until \"false\";
EOF"
  apt-get --quiet update
  apt-get --quiet --verbose-versions --yes --no-install-recommends install apt-utils apt-transport-https gnupg
  ;;
jessie)
  eval "cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian ${RELEASE} main
deb http://security.debian.org/debian-security ${RELEASE}/updates main
EOF"
  apt-get --quiet update
  apt-get --quiet --verbose-versions --yes --no-install-recommends install apt-utils apt-transport-https gnupg
  ;;
stretch)
  eval "cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian ${RELEASE} main
deb http://deb.debian.org/debian ${RELEASE}-updates main
deb http://security.debian.org/debian-security ${RELEASE}/updates main
EOF"
  apt-get --quiet update
  apt-get --quiet --verbose-versions --yes --no-install-recommends install apt-utils apt-transport-https gnupg dirmngr
  ;;
esac
