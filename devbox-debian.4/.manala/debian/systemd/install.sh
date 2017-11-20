#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=751636
apt-get -y --no-install-recommends install systemd systemd-sysv dbus libpam-systemd
