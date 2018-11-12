# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Changed
- Update VirtualBox Guest Additions 5.2.22
- Vagrant required version >= 2.2.0
- Update Alt Galaxy 1.4.1
- Update Gitsplit 2.0
- Update Debian 9.6.0

### Removed
- Remove custom ansible configuration, due to relative blocking updates
  (see: https://github.com/hashicorp/vagrant/pull/9957)
- Remove docker service support

## [4.0.2] - 2018-02-07
### Removed
- Packaged Vagrantfile with structuring default options (resulted in issues with
  duplicated network adapters)

### Changed
- Update Ansible 2.4.3.0
- Update Git 2.14.2

## [4.0.1] - 2018-01-30
### Changed
- Update VirtualBox Guest Additions 5.2.6

### Fixed
- Don't pre-create VirtualBox network interfaces anymore (let VirtualBox decides
  which one is the best for targetted plateform, as "virtio" cause nfs issues)
- Keep current linux headers installed so that VirtualBox Guest Additions could be
  re-compiled in case of kernel update

### Added
- Include template version in VirtualBox machine description

## [4.0.0] - 2018-01-15
### Added
- Initial release
