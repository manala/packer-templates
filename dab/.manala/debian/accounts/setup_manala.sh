#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

printf "[\033[36mManala\033[0m] \033[32mDebian - Accounts - Setup manala\033[0m\n"

apt-get -y --no-install-recommends install sudo

cat <<EOF > /etc/sudoers.d/manala
manala ALL=(ALL) NOPASSWD:ALL
EOF

chmod 0440 /etc/sudoers.d/manala

groupadd \
  --gid 1000 \
  manala

useradd \
  --create-home \
  --shell /bin/bash \
  --uid 1000 \
  --gid 1000 \
  --groups sudo \
  --password $1$hVMBHhKk$4zC4YK.KRk3Vy9fmLd7681 \
  --key UMASK=022 \
  --comment Manala \
  manala
