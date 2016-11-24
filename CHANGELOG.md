# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- Install alt-galaxy as a (faster) alternative to ansible-galaxy

### Changed
- Update to debian 8.6
- Vagrant: remove google dns servers
- App user uid/gid hardly set to 1337/1337
- Vagrant: update VirtualBox Guest Additions to 5.1.10

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
