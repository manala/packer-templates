# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Fixed
- Don't pre-create VirtualBox network interfaces anymore (let VirtualBox decides
  which one is the best for targetted plateform, as "virtio" cause nfs issues)
- Keep current linux headers installed so that VirtualBox Guest Additions could be
  re-compiled in case of kernel update

## [4.0.0] - 2018-01-15
### Added
- Initial release
