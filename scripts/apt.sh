#!/bin/bash

# Get debian version (wheezy,jessie,...)
VERSION=$(cat /etc/os-release | sed -n 's/.*VERSION="[0-9] (\(.*\))"/\1/p')

cat <<EOF > /etc/apt/sources.list
deb http://httpredir.debian.org/debian $VERSION main non-free contrib
deb-src http://httpredir.debian.org/debian $VERSION main non-free contrib

deb http://security.debian.org/ $VERSION/updates main contrib non-free
deb-src http://security.debian.org/ $VERSION/updates main contrib non-free

# $VERSION-updates, previously known as 'volatile'
deb http://httpredir.debian.org/debian $VERSION-updates main contrib non-free
deb-src http://httpredir.debian.org/debian $VERSION-updates main contrib non-free
EOF

cat <<EOF > /etc/apt/sources.list.d/debian_manala_io.list
deb http://debian.manala.io $VERSION main
EOF

apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net 1394DEA3

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
