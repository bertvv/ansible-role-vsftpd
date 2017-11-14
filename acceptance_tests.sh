#! /usr/bin/bash
#
# Author: Bert Van Vreckem <bert.vanvreckem@gmail.com>
#
# Acceptance tests for Ansible role bertvv.vsftpd
#
# These should be run after provisioning the VMs

set -o errexit # abort on nonzero exitstatus
set -o nounset # abort on unbound variable

#{{{ Variables
# Default values for server IP's (see Vagrantfile)
if [ "$#" -eq "0" ]; then
  set 192.168.56.22
fi

# File to be fethed from the server + expected content
# (see test.yml)
file="README"
anon_file_content="anon_root"
local_file_content="local_root"

# User credentials
user="vagrant"
pass="vagrant"
#}}}

#{{{ Functions
# Usage try_anon_get SERVER_IP
try_anon_get() {
  local server="$1"
  local url="ftp://${server}/${file}"
  echo -n "Fetching file anonymously... "
  local result
  result=$(curl --silent "${url}")

  if [ "${result}" != "${anon_file_content}" ]; then
    echo "FAIL."
    echo "Try curl ftp://${server}/${file}"
    return 1
  else
    echo "ok"
  fi
}

# Usage try_anon_get SERVER_IP
try_local_get() {
  local server="$1"
  local url="ftp://${server}/${file}"
  echo -n "Fetching file as user ${user}... "
  local result
  result=$(curl --silent --user "${user}:${pass}" "${url}")

  if [ "${result}" != "${local_file_content}" ]; then
    echo "FAIL."
    echo "Try curl --user "${user}:${pass}" ftp://${server}/${file}"
    return 1
  else
    echo "ok"
  fi
}

#}}}

# Script proper
for server; do
  echo -e "\n${server}"
  try_anon_get "${server}"
  try_local_get "${server}"
done

