#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mDebian - VirtualBox - Install additions\033[0m\n"

export DEBIAN_FRONTEND=noninteractive

# Remove standard virtualbox packages
apt-get --yes purge --auto-remove virtualbox-\*

# Install dependencies
apt-get --quiet --verbose-versions --yes --no-install-recommends install bzip2

# Install build dependencies & packages
apt-get --quiet --verbose-versions --yes --no-install-recommends install dkms linux-headers-$(uname -r)

# Install the virtualbox guest additions
mount --options loop ~/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -f VBoxGuestAdditions.iso

# Remove build dependencies & packages
apt-get --yes --auto-remove purge dkms linux-headers-$(uname -r)
