# Ansible role `vsftpd`

An Ansible role for setting up Vsftpd under CentOS/RHEL 7. Specifically, the responsibilities of this role are to:

- install necessary packages
- manage configuration
- manage SELinux settings

The following are out of the scope of this role:

- configuring the firewall

## Requirements

No specific requirements

## Role Variables

Please refer to the [vsftpd.conf(5)](http://vsftpd.beasts.org/vsftpd_conf.html) man page for detailed info on the variables listed below. The variable names here are consistent with the Vsftpd configuration parameters.

| Variable                      | Default | Comments (type)                                                                             |
| :---                          | :---    | :---                                                                                        |
| `vsftpd_anon_root`            | -       | Directory for guest users. Defaults to home directory of the `ftp` user.                    |
| `vsftpd_anonymous_enable`     | YES     | Specifies whether anonymous logins are permitted or not.                                    |
| `vsftpd_config`               | -       | List of dicts for other options not available as role variables. See below.                 |
| `vsftpd_connect_from_port_20` | YES     | Controls whether PORT style data connections use port 20 on the server. machine.            |
| `vsftpd_listen`               | YES     | When enabled, run `vsftpd` in standalone mode. Mutually exclusive with `vsftpd_listen_ipv6` |
| `vsftpd_listen_ipv6`          | NO      | When enabled, run `vsftpd` in standalone mode, over IPv6.                                   |
| `vsftpd_local_enable`         | NO      | Specifies whether logins from registered users are permitted or not.                        |
| `vsftpd_local_root`           | -       | Directory for registered users. Defaults to their home directory.                           |
| `vsftpd_local_umask`          | 022     | The value that the umask for file creation is set to for local users.                       |
| `vsftpd_syslog_enable`        | YES     | If enabled, log output goes to the system log (`journalctl -u vsftpd.service`)              |
| `vsftpd_write_enable`         | YES     | Controls whether any FTP commands which change the filesystem are allowed or not.           |


## Dependencies

No dependencies.

## Example Playbook

See the [test playbook](tests/test.yml)

## Testing

Tests for this role are provided in the form of a Vagrant environment that is kept in a separate branch, `tests`. I use [git-worktree(1)](https://git-scm.com/docs/git-worktree) to include the test code into the working directory. Instructions for running the tests:

1. Fetch the tests branch: `git fetch origin tests`
2. Create a Git worktree for the test code: `git worktree add tests tests` (remark: this requires at least Git v2.5.0). This will create a directory `tests/`.
3. `cd tests/`
4. `vagrant up` will then create a VM and apply a test playbook (`test.yml`).

You may want to change the base box into one that you like. The current one, [bertvv/centos71](https://atlas.hashicorp.com/bertvv/boxes/centos71) was generated using a Packer template from the [Boxcutter project](https://github.com/boxcutter/centos) with a few modifications.

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section. Pull requests are also very welcome. Preferably, create a topic branch and when submitting, squash your commits into one (with a descriptive message).

## License

BSD

## Author Information

Bert Van Vreckem (bert.vanvreckem@gmail.com)

