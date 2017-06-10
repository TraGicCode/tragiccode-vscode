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
  Stdlib::Absolutepath $vscode_user_code_directory = $vscode::params::vscode_user_code_directory,
  Stdlib::Absolutepath $vscode_user_user_directory = $vscode::params::vscode_user_user_directory,
  Stdlib::Absolutepath $vscode_user_settings_file_absolute_path = $vscode::params::vscode_user_settings_file_absolute_path,
  Optional[Enum['vs-minimal', 'vs-seti']] $icon_theme = $vscode::params::icon_theme,
  Optional[String] $color_theme = $vscode::params::color_theme,
) inherits vscode::params {

  contain vscode::install
  contain vscode::config

  Class['vscode::install']
  -> Class['vscode::config']

}
