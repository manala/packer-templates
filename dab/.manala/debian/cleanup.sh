#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mDebian - Cleanup\033[0m\n"

# Delete all Linux headers
dpkg --list \
  | awk '{ print $2 }' \
  | grep 'linux-headers' \
  | xargs apt-get -y purge;

# Remove specific Linux kernels, such as linux-image-3.11.0-15 but
# keeps the current kernel and does not touch the virtual packages,
# e.g. 'linux-image-amd64', etc.
dpkg --list \
    | awk '{ print $2 }' \
    | grep 'linux-image-[234].*' \
    | grep -v `uname -r` \
    | xargs apt-get -y purge;

# Delete Linux source
dpkg --list \
    | awk '{ print $2 }' \
    | grep linux-source \
    | xargs apt-get -y purge;

# Delete X11 libraries
apt-get -y purge libx11-data xauth libxmuu1 libxcb1 libx11-6 libxext6

# Delete obsolete networking
apt-get -y purge ppp pppconfig pppoeconf

# Delete oddities
apt-get -y purge popularity-contest

apt-get -y --purge autoremove
apt-get -y clean

rm --force --recursive /var/lib/apt/lists/*

# Delete any logs that have built up during the install
find /var/log/ \
  -name *.log \
  -exec rm --force {} \;

# Delete any non relevant user's dotfiles
find /root /home/ \
  \( -name '.bash_history' -o -name '.zsh_history' -o -name '.zcompdump-*' -o -name '.ansible' \) \
  -prune -exec rm --force --recursive {} \;
