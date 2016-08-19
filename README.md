# Skeleton

## App - Dev - Debian

Debian 8 - amd64

62Go ext4, 2Go swap

* Openssh-server
* Nfs support (nfs-common, cachefilesd)
* VirtualBox Guest Additions 5.0.26 (dkms, linux-headers)
* Ansible 2.1.1.0
* Vim 7.4
* Git 2.1.4
* Oh-my-zsh
* Make 4.0
* MailHog 0.2.0
* Supervisor 3.2.0
* Ntp 4.2.6
* Ngrok 2.1.3
* Pre-installed manala ansible roles
  * manala.ansible-galaxy
  * manala.apt
  * manala.skeleton (with dependencies)

### 3.0.7

* Rollback to VirtualBox Guest Additions 5.0.26

### 3.0.6

* Don't pre-install relevant apt keys anymore

### 3.0.5

* Introduce ansible group "app_local"

### 3.0.4

* Update to debian 8.5
* Update to ansible 2.1.0.0
* Pre-install relevant apt keys

### 3.0.3

* Remove deploy manala ansible role (preferred way is now to install it locally, so that one can deploy without having vagrant box or docker container running)
* Keep bzip2 installed for further virtualbox guest additions usage
* Always use apt-get --no-install-recommends option
* Update ansible hosts from env_dev to app/app_dev

### 3.0.2

* Introduce local ansible inventory

### 3.0.1

* Replace chrony by ntp
* Update VirtualBox Guest Additions from 5.0.18 to 5.0.20

### 3.0.0

* Manala debian repository
* Ansible 2 as debian manala repository package
* Disable splash screen during preseed
* Use google dns servers
* Default locale to C.UTF-8


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
