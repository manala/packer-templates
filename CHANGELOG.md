# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- Install alt-galaxy as a (faster) alternative to ansible-galaxy

### Changed
- App user uid/gid hardly set to 1337/1337
- Vagrant: remove google dns servers

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
