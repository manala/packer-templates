#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

cat <<EOF > /etc/apt/sources.list.d/proxmox.list
deb http://download.proxmox.com/debian/pve stretch pve-no-subscription
EOF

wget -O- "http://download.proxmox.com/debian/proxmox-ve-release-5.x.gpg" | apt-key add -

apt-get update

apt-get -y --no-install-recommends install dab xz-utils
