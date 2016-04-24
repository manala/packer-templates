# Debian 8 - amd64 #

62Go ext4, 2Go swap

 * Debian 8.4 - amd64
   * Openssh-server
   * Nfs support (nfs-common, cachefilesd)
   * VirtualBox Guest Additions 5.0.18 (dkms, linux-headers)
   * Ansible 2.0.2.0 (manala)
   * Vim 7.4
   * Git 2.1.4
   * Oh-my-zsh
   * Make 4.0

### 1.0.0

* Vagrant user member of group "vagrant"
* Manala debian repository
* Ansible 2 as debian manala repository package
* Disable splash screen during preseed
* Use google dns servers
* Default locale to C.UTF-8
