# Skeleton

## App - Dev - Debian

Debian 8 - amd64

62Go ext4, 2Go swap

* Openssh-server
* Nfs support (nfs-common, cachefilesd)
* VirtualBox Guest Additions 5.0.18 (dkms, linux-headers)
* Ansible 2.0.2.0
* Vim 7.4
* Git 2.1.4
* Oh-my-zsh
* Make 4.0
* MailHog 0.2.0
* Supervisor 3.2.0
* Chrony 2.1.1
* ngrok 2.0.25
* Pre-installed manala ansible roles
  * manala.ansible-galaxy
  * manala.apt
  * manala.skeleton
  * manala.deploy

### 3.0.0

* Manala debian repository
* Ansible 2 as debian manala repository package
* Disable splash screen during preseed
* Use google dns servers
* Default locale to C.UTF-8
