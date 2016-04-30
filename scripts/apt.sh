#!/bin/bash

cat <<EOF > /etc/apt/sources.list
deb http://httpredir.debian.org/debian jessie main non-free contrib
deb-src http://httpredir.debian.org/debian jessie main non-free contrib

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free

# jessie-updates, previously known as 'volatile'
deb http://httpredir.debian.org/debian jessie-updates main contrib non-free
deb-src http://httpredir.debian.org/debian jessie-updates main contrib non-free
EOF

cat <<EOF > /etc/apt/sources.list.d/debian_manala_io.list
deb http://debian.manala.io jessie main
EOF

apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net 1394DEA3

apt-get -y update
apt-get -y dist-upgrade
