#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get --quiet --verbose-versions --yes --no-install-recommends install curl ca-certificates bsdtar

curl --location https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip \
  | bsdtar -xf - -C /usr/local/bin

chmod +x /usr/local/bin/packer

# LXC
apt-get --quiet --verbose-versions --yes --no-install-recommends install lxc debootstrap
