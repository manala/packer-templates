#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mDebian - Systemd - Disable tty1\033[0m\n"

systemctl mask getty@tty1.service
