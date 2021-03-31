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
# [*ensure*]
#   Ensure parameter passed onto Service[] resources.
#   Default: running
#
# @example
#    class { 'vscode':
#      package_ensure => 'present',
#    }
#
# Authors
# -------
#
# Author Name <michael@tragiccode.com>
#
# Copyright
# ---------
#
# Copyright 2017
#
class vscode(
  String $package_source_url,
  Stdlib::HttpUrl $package_repo_url,
  Stdlib::Absolutepath $code_dir = extlib::path_join([$::facts[appdata], 'Code']),
  Stdlib::Absolutepath $code_user_dir = extlib::path_join([$code_dir, 'User']),
  Stdlib::Absolutepath $code_settings_file = extlib::path_join([$code_user_dir, 'settings.json']),
  Enum['present', 'absent'] $package_ensure = present,
  Boolean $manage_package = true,
  Boolean $manage_repo = true,
) {

  contain vscode::install
  contain vscode::config

  Class['vscode::install']
  -> Class['vscode::config']

}
