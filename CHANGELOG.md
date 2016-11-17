# Change log

This file contains al notable changes to the bertvv.vsftpd Ansible role. This file adheres to the guidelines of [http://keepachangelog.com/](http://keepachangelog.com/). Versioning follows [Semantic Versioning](http://semver.org/).

## 2.0.0 - 2016-11-17

### Changed

- Use the OS independent package module. This breaks compatibility with Ansible <2.0, hence the major version bump.

## 1.0.0 - 2015-12-15

First release!

### Added

- Installs and configures Vsftpd
- Tested on CentOS 7, Ubuntu LTS 12.04 (precise) and 14.04 (trusty)

