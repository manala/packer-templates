#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

export DEBIAN_FRONTEND=noninteractive

# See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=751636
apt-get -y --no-install-recommends install libpam-systemd
