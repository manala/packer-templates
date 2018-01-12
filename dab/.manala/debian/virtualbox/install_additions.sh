#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

printf "[\033[36mManala\033[0m] \033[32mDebian - VirtualBox - Install additions\033[0m\n"

# Remove standard virtualbox packages
apt-get -y purge --auto-remove virtualbox-\*

# Install dependencies
apt-get -y --no-install-recommends install bzip2 dkms

# Install build dependencies
apt-get -y --no-install-recommends install linux-headers-amd64

# Install the virtualbox guest additions
mkdir -p /mnt/VBoxGuestAdditions
mount --options loop ~/VBoxGuestAdditions.iso /mnt/VBoxGuestAdditions
sh /mnt/VBoxGuestAdditions/VBoxLinuxAdditions.run
umount /mnt/VBoxGuestAdditions
rm -Rf /mnt/VBoxGuestAdditions
rm -f VBoxGuestAdditions.iso

# Remove build dependencies
apt-get -y purge --auto-remove linux-headers-amd64
