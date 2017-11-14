# Change log

This file contains al notable changes to the bertvv.vsftpd Ansible role. This file adheres to the guidelines of [http://keepachangelog.com/](http://keepachangelog.com/). Versioning follows [Semantic Versioning](http://semver.org/).

## 2.1.0 - 2017-11-10

## Added

- Role variables `vsftpd_owner`, `vsftpd_group`, for setting the owner of `local_root` and `anon_root`.
- Role variable `vsftpd_mode` for setting the file permissions of `local_root` and `anon_root`.
- (GH-5) Support for CentOS 6 (credit: @renux360)

### Changed

- Fix Ansible 2.4 deprecation warnings

## 2.0.2 - 2017-04-02

### Changed

- (GH-4) Fixed testing for SELinux status
- Added Debian Jessie to the list of supported platforms

Ubuntu 14.04 and 16.04 should also work, but the Docker tests still fail.

## 2.0.1 - 2017-02-03

### Changed

- (GH-3) Only enable SELinux boolean ftp_home_dir when it is present
- Added Vagrant and Docker test branches
- Added support for Fedora 25

## 2.0.0 - 2016-11-17

### Changed

- Use the OS independent package module. This breaks compatibility with Ansible <2.0, hence the major version bump.

## 1.0.0 - 2015-12-15

First release!

### Added

- Installs and configures Vsftpd
- Tested on CentOS 7, Ubuntu LTS 12.04 (precise) and 14.04 (trusty)

