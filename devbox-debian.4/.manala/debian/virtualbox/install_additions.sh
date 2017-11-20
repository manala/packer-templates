#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# Remove standard virtualbox packages
apt-get -y purge --auto-remove virtualbox-\*

# Install dependencies
apt-get -y --no-install-recommends install bzip2

# Install build dependencies & packages
apt-get -y --no-install-recommends install dkms linux-headers-$(uname -r)

# Install the virtualbox guest additions
mount --options loop ~/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -f VBoxGuestAdditions.iso

# Remove build dependencies & packages
apt-get -y purge --auto-remove dkms linux-headers-$(uname -r)
