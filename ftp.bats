#! /usr/bin/env bats
#
# Functional tests for an FTP server.
# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Variables
readonly file=README
anon_file_content='anon_root'
local_file_content='local_root'

user='alice'
pass='alice'

# Tests
@test 'Anonymous access should work' {
  local url="ftp://${SUT_IP}/${file}"
  run curl --silent "${url}"

  [ "${status}" -eq '0' ]
  [ "${output}" = "${anon_file_content}" ]
}

@test 'Authenticated access should work' {
  local url="ftp://${SUT_IP}/${file}"
  run curl --silent --user "${user}:${pass}" "${url}"

  [ "${status}" -eq "0" ]
  [ "${output}" = "${local_file_content}" ]
}
