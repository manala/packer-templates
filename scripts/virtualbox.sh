#!/bin/bash

# Remove standard virtualbox packages
apt-get -y purge --auto-remove virtualbox-\*

# Install build dependencies & packages
DEBIAN_FRONTEND=noninteractive apt-get -y install bzip2 dkms linux-headers-$(uname -r)

# Install the virtualbox guest additions
cd ~
mount -o loop VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions.iso

# Remove build dependencies & packages
apt-get -y purge --auto-remove bzip2 dkms linux-headers-$(uname -r)
