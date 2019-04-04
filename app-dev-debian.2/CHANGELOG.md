# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Changed
- Update VirtualBox Guest Additions 6.0.4
- Vagrant required version >= 2.2.4
- Update Ngrok 2.3.25

## [2.0.8] - 2018-11-19
### Changed
- Update VirtualBox Guest Additions 5.2.22
- Update Ansible 2.6.5
- Vagrant required version >= 2.2.1
- Update Alt Galaxy 1.4.1
- Update Gitsplit 2.0

### Removed
- Remove custom ansible configuration, due to relative blocking updates
  (see: https://github.com/hashicorp/vagrant/pull/9957)

## [2.0.7] - 2018-02-07
### Changed
- Update VirtualBox Guest Additions 5.2.6
- Quieter ansible configuration (stdout_callback skippy, display_skipped_hosts false
  system_warnings false, deprecation_warnings false, command_warnings false,
  retry_files_enabled false)
- Update Ansible 2.4.3.0
- Update Mailhog 1.0.0
- Update Ngrok 2.2.8

### Fixed
- Don't remove "dkms" debian package anymore, so that VirtualBox Guest
  Additions kernel modules are still loaded after a kernel upgrade
- Keep current linux headers installed so that VirtualBox Guest Additions could be
  re-compiled in case of kernel update

### Added
- VirtualBox tweaks (usb off, audio none, chipset ich9, sata ahci/iocache/nonrotational)
- Include template version in VirtualBox machine description

### Removed
- Docker package
- The Fuck package

## [2.0.6] - 2017-02-15
### Changed
- Switch to debian backports openssl to allow ed25519 keys

## [2.0.5] - 2017-02-08
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
- Vagrant: remove google dns servers
- App user uid/gid hardly set to 1337/1337
- Vagrant: update VirtualBox Guest Additions to 5.1.14

### Fixed
- Fix manala debian repository source

## [2.0.4] - 2016-08-19
### Changed
- Rollback to VirtualBox Guest Additions 5.0.26

## [2.0.3] - 2016-08-18
### Changed
- Don't pre-install relevant apt keys anymore

## [2.0.2] - 2016-06-14
### Added
- Introduce ansible group "app_local"

## [2.0.1] - 2016-06-10
### Added
- Pre-install relevant apt keys

### Changed
- Update to debian 7.11
- Update to ansible 2.1.0.0
- Vim and Git packages from backports

## [2.0.0] - 2016-06-03
### Added
- Based on 3.0.3
