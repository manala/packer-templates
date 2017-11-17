#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mDebian - Docker - Cleanup - Systemd\033[0m\n"

# Ensure "multi-user" (and not "graphical") is default target
systemctl set-default multi-user.target

systemctl mask \
  systemd-ask-password-wall.path \
  systemd-ask-password-console.path \
  systemd-logind.service

# Disable useless mount units
systemctl mask \
  dev-hugepages.mount \
  proc-sys-fs-binfmt_misc.automount \
  sys-fs-fuse-connections.mount \
  sys-kernel-config.mount \
  sys-kernel-debug.mount

# Disable local/remote file systems, swap & encrypted volumes target units
systemctl mask \
  local-fs.target \
  remote-fs.target \
  swap.target \
  cryptsetup.target

# Disable system time synchronization
systemctl mask time-sync.target

## Disable useless timers
systemctl mask \
  apt-daily-upgrade.timer \
  apt-daily.timer \
  systemd-tmpfiles-clean.timer

# Disable getty (cause login issues in docker privileged mode)
systemctl mask getty.target
