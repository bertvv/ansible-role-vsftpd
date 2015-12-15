# Ansible role `vsftpd`

[![Build Status](https://travis-ci.org/bertvv/ansible-role-vsftpd.svg?branch=master)](https://travis-ci.org/bertvv/ansible-role-vsftpd)

An Ansible role for setting up Vsftpd under CentOS/RHEL 7, Ubuntu LTS 12.04 (precise), or 14.04 (trusty). Specifically, the responsibilities of this role are to:

- install necessary packages
- manage configuration
- manage SELinux settings, when it is enabled

Configuring the firewall is outside the scope of this role. Use another role suitable for your distribution, e.g. [bertvv.el7](https://galaxy.ansible.com/detail#/role/2305).

If you like/use this role, please consider giving it a star or reviewing it on Ansible Galaxy. Thanks!

## Requirements

No specific requirements

## Role Variables

Please refer to the [vsftpd.conf(5)](http://vsftpd.beasts.org/vsftpd_conf.html) man page for detailed info on the variables listed below. The variable names here are consistent with the Vsftpd configuration parameters.

| Variable                      | Default | Comments (type)                                                                             |
| :---                          | :---    | :---                                                                                        |
| `vsftpd_anon_root`            | -       | Directory for guest users. Defaults to home directory of the `ftp` user.                    |
| `vsftpd_anonymous_enable`     | true    | Specifies whether anonymous logins are permitted or not.                                    |
| `vsftpd_config`               | -       | List of dicts for other options not available as role variables. See below.                 |
| `vsftpd_connect_from_port_20` | true    | Controls whether PORT style data connections use port 20 on the server. machine.            |
| `vsftpd_listen`               | true    | When enabled, run `vsftpd` in standalone mode. Mutually exclusive with `vsftpd_listen_ipv6` |
| `vsftpd_listen_ipv6`          | false   | When enabled, run `vsftpd` in standalone mode, over IPv6.                                   |
| `vsftpd_local_enable`         | false   | Specifies whether logins from registered users are permitted or not.                        |
| `vsftpd_local_root`           | -       | Directory for registered users. Defaults to their home directory.                           |
| `vsftpd_local_umask`          | 022     | The value that the umask for file creation is set to for local users.                       |
| `vsftpd_syslog_enable`        | true    | If enabled, log output goes to the system log (`journalctl -u vsftpd.service`)              |
| `vsftpd_write_enable`         | true    | Controls whether any FTP commands which change the filesystem are allowed or not.           |

Vsftpd options not provided in the list above can be added with `vsftpd_options` as a list of dicts with two fields, `key` and `value`. **Remark** that boolean options should be specified with `'YES'` or `'NO` *within quotes*. Otherwise the Jinja template engine will interpret these values as booleans instead of strings an translate them into, "True" and "False", respectively.

```Yaml
vsftpd_options:
  - key: xferlog_enable
    value: 'YES'
  - key: xferlog_file
    value: /var/log/vsftp_xfer.log
```

## Dependencies

No dependencies.

## Example Playbook

See the [test playbook](tests/test.yml)

## Testing

There are two sets of tests for this role. The role is tested automatically on all supported platforms on Travis CI. Click through on the build status emblem above.

You can also run tests for this role locally in a Vagrant environment that is kept in a separate branch, `tests`. I use [git-worktree(1)](https://git-scm.com/docs/git-worktree) to include the test code into the working directory. Instructions for running the tests:

1. Fetch the tests branch: `git fetch origin tests`
2. Create a Git worktree for the test code: `git worktree add tests tests` (remark: this requires at least Git v2.5.0). This will create a directory `tests/`.
3. `cd tests/`
4. `vagrant up` will then create VMs and apply a test playbook (`test.yml`). Currently, Ubuntu 14.04 and CentOS 7 are tested.
5. Running the script `./acceptance_tests.sh` will check if the servers actually serve files, both anonymously, and as a registered user.

The tests are run on the following platforms:

- CentOS 7, with base box [bertvv/centos71](https://atlas.hashicorp.com/bertvv/boxes/centos71), generated using a Packer template from the [Boxcutter project](https://github.com/boxcutter/centos) with a few modifications;
- Ubuntu 14.04, with base box ubuntu/trusty64 (official)

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section. Pull requests are also very welcome.

## License

BSD

## Author Information

Bert Van Vreckem (bert.vanvreckem@gmail.com)

