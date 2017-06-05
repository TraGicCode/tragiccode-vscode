# Class: vscode::config
#
#
class vscode::config(
  Stdlib::Absolutepath $vscode_user_code_directory = $::vscode::vscode_user_code_directory,
  Stdlib::Absolutepath $vscode_user_user_directory = $::vscode::vscode_user_user_directory,
  Stdlib::Absolutepath $vscode_user_settings_file_absolute_path = $::vscode::vscode_user_settings_file_absolute_path,
) inherits vscode {

  file { [$vscode_user_code_directory, $vscode_user_user_directory]:
    ensure => 'directory',
  }

  file { $vscode_user_settings_file_absolute_path:
    ensure => 'file',
  }

}