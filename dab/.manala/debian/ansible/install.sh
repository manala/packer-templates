#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

printf "[\033[36mManala\033[0m] \033[32mDebian - Ansible - Install\033[0m\n"

apt-get -y --no-install-recommends install ansible alt-galaxy
