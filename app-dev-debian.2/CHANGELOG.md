# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Changed
- Vagrant: update VirtualBox Guest Additions to 5.2.4

### Fixed
- Don't remove "dkms" debian package anymore, so that VirtualBox Guest
  Additions kernel modules are still loaded after a kernel upgrade
- Keep current linux headers installed so that VirtualBox Guest Additions could be
  re-compiled in case of kernel update

### Added
- Include template version in VirtualBox machine description

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
