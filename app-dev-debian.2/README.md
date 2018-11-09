# Packer Template: App Dev Debian - 2

## Requirements

* Packer 1.2.0+

## Description

Debian 7 - amd64

62Go ext4, 2Go swap

* Openssh-server
* Nfs support (nfs-common, cachefilesd)
* Ansible 2.4.3.0
* Alt Galaxy 1.3.3
* VirtualBox Guest Additions 5.2.20 (dkms, linux-headers)
* Vim 7.4
* Debfoster 2.7
* Git 1.9.1
* Gitsplit
* Htop 1.0.1
* Rsync 3.0.9
* Curl 7.26.0
* Oh-my-zsh
* Make 3.81
* MailHog 1.0.0
* Supervisor 3.3.1
* Ntp 4.2.6p5
* Ngrok 2.2.8
* Pre-installed manala ansible roles
  * manala.ansible-galaxy
  * manala.skeleton (with dependencies)
* Passwordless app & root accounts
