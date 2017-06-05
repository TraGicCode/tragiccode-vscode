# Class: vscode
# ===========================
#
# Full description of class vscode here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'vscode':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class vscode(
  Enum['present', 'installed', 'absent'] $package_ensure = $vscode::params::package_ensure,
  String $package_name = $vscode::params::package_name,
  String $vscode_download_url = $vscode::params::vscode_download_url,
  Stdlib::Absolutepath $vscode_download_absolute_path = $vscode::params::vscode_download_absolute_path,
  Boolean $disable_extensions = $vscode::params::disable_extensions,
  Boolean $create_desktop_icon = $vscode::params::create_desktop_icon,
  Boolean $create_quick_launch_icon = $vscode::params::create_quick_launch_icon,
  Boolean $create_context_menu_files = $vscode::params::create_context_menu_files,
  Boolean $create_context_menu_folders = $vscode::params::create_context_menu_folders,
  Boolean $add_to_path = $vscode::params::add_to_path,
) inherits vscode::params {

  contain vscode::install
  contain vscode::config

  Class['vscode::install']
  -> Class['vscode::config']

}
