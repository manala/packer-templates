#!/bin/sh

# Remove 5 sec grub timeout to speed up booting
sed -i 's/GRUB_TIMEOUT=[0-9]\+/GRUB_TIMEOUT=0/' /etc/default/grub

update-grub
