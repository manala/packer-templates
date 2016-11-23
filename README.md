# Skeleton



## App - Dev - Debian

Debian 7 - amd64

62Go ext4, 2Go swap

* Openssh-server
* Nfs support (nfs-common, cachefilesd)
* VirtualBox Guest Additions 5.0.26 (dkms, linux-headers)
* Ansible 2.1.1.0
* Vim 7.4
* Git 1.9.1
* Oh-my-zsh
* Make 3.81
* MailHog 0.2.0
* Supervisor 3.2.0
* Ntp 4.2.6p5
* Ngrok 2.1.3
* Pre-installed manala ansible roles
  * manala.ansible-galaxy
  * manala.apt
  * manala.skeleton (with dependencies)

### 2.0.4

* Rollback to VirtualBox Guest Additions 5.0.26

### 2.0.3

* Don't pre-install relevant apt keys anymore

### 2.0.2

* Introduce ansible group "app_local"

### 2.0.1

* Update to debian 7.11
* Update to ansible 2.1.0.0
* Vim and Git packages from backports
* Pre-install relevant apt keys

### 2.0.0

* Based on 3.0.3
