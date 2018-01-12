# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- Virtualbox tweaks (usb off, audio none, chipset ich9, nictype virtio, sata ahci/iocache/nonrotational)
- Packaged Vagrantfile with structuring default options (ssh username/forward_agent)
- Exa 0.8.0
- HTTPie 0.9.8

### Changed
- Update to debian 8.10.0
- Update VirtualBox Guest Additions 5.2.4
- Quieter ansible configuration (stdout_callback skippy, display_skipped_hosts false
  system_warnings false, deprecation_warnings false, command_warnings false,
  retry_files_enabled false)
- Update Ansible 2.4.2.0
- Update Docker 17.12.0
- Update Ngrok 2.2.8

### Fixed
- Don't remove "dkms" debian package anymore, so that VirtualBox Guest
  Additions kernel modules are still loaded after a kernel upgrade

## [3.0.10] - 2017-05-09
### Changed
- Update to debian 8.8.0
- Update VirtualBox Guest Additions 5.1.22
- Update Docker 17.05.0
- Update Mailhog 1.0.0

## [3.0.9] - 2017-04-06
### Changed
- Update VirtualBox Guest Additions 5.1.18
- Update Docker 17.04.0
- Update Git 2.11.0
- Update Ngrok 2.2.3

### Fixed
- Docker bridge network "docker0" is now absent on first boot, thanks to
  docker socket used instead of docker service. Mainly fix vagrant nfs mounts,
  where network interfaces were unfortunately swapped.

## [3.0.8] - 2017-02-08
### Added
- Add rsync package
- Add curl package
- Add ssl-cert package
- Install alt-galaxy as a (lot faster) alternative to ansible-galaxy
- Add The Fuck package
- Add debfoster package (useful for complex ansible roles, such as php)
- Add docker package
- Gitsplit
- Htop

### Changed
- Update to debian 8.7.1
- Vagrant: remove google dns servers
- App user uid/gid hardly set to 1337/1337
- Vagrant: update VirtualBox Guest Additions to 5.1.14

### Fixed
- Fix manala debian repository source

## [3.0.7] - 2016-08-19
### Changed
- Rollback to VirtualBox Guest Additions 5.0.26

## [3.0.6] - 2016-08-18
### Changed
- Don't pre-install relevant apt keys anymore

## [3.0.5] - 2016-06-14
### Added
- Introduce ansible group "app_local"

## [3.0.4] - 2016-06-10
### Added
- Pre-install relevant apt keys

### Changed
- Update to debian 8.5
- Update to ansible 2.1.0.0

## [3.0.3] - 2016-06-03
### Changed
- Remove deploy manala ansible role (preferred way is now to install it locally, so that one can deploy without having vagrant box or docker container running)
- Keep bzip2 installed for further virtualbox guest additions usage
- Always use apt-get --no-install-recommends option
- Update ansible hosts from env_dev to app/app_dev

## [3.0.2] - 2016-05-24
### Added
- Introduce local ansible inventory

## [3.0.1] - 2016-05-04
### Changed
- Replace chrony by ntp
- Update VirtualBox Guest Additions from 5.0.18 to 5.0.20

## [3.0.0] - 2016-04-28
### Added
- Manala debian repository
- Ansible 2 as debian manala repository package
- Disable splash screen during preseed
- Use google dns servers
- Default locale to C.UTF-8
