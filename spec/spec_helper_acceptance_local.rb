# frozen_string_literal: true

require 'puppet_litmus'
require 'singleton'

class Helper
  include Singleton
  include PuppetLitmus
end

# @summary: Helper function to run common functionality of MOTD acceptance tests.
#           Applies the manifest twice, if not windows checks for file against expected contents.
# @param [string]  pp:                  Puppet code definition to be tested
# @param [string]  expected_contain:    Expected contents of the file to be compared
# @param [string]  filename:            file to be tested
#
def test_sshkeys(pp, expected_contain, filename)
  idempotent_apply(pp)

  return unless os[:family] != 'windows'
  expect(file(filename)).to be_file
  expect(file(filename)).to contain expected_contain
end

# @summary: read hosts and ports for ssh connect from inventory file
#
# @return [array] hosts: Hash of host and port pairs
#
def read_hosts_ssh_ports
  hosts = []
  inv = inventory_hash_from_inventory_file
  inv['groups'].each do |group|
    name = group['name']
    next unless name == 'ssh_nodes'
    targets = group['targets']
    targets.each do |target|
      uri = target['uri']
      (host, port) = uri.split(':')
      hosts << {
        'host' => host,
        'port' => port,
      }
    end
  end
  hosts
end

# @summary: connect to a host using ssh and execute hostname
#
# @param [string] host: host to connect by ssh
# @param [int]    port: port to connect
# @param [string] user: user to connect with
# @param [array]  keys: array with ssh keys to use for connect
#
def connect_by_ssh(host, port, user, keys)
  hn = ''
  Net::SSH.start(
    host, user,
    port: port,
    keys: keys,
    timeout: 1,
    password: 'none'
  ) do |session|
    hn = session.exec!('hostname')
  end
  hn.chomp!
end
