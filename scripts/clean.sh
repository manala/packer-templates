#!/bin/bash

# Clean leftover leases and persistent rules
rm /var/lib/dhcp/*

# Clean udev rules
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

# Clean apt
apt-get -y --purge autoremove
apt-get -y clean
rm -rf /var/lib/apt/lists/*

# Clean tmp
rm -rf /tmp/*
