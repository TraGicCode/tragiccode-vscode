# Class: vscode::config
#
#
class vscode::config inherits vscode {

  file { $::vscode::vscode_user_settings_file_absolute_path:
    ensure => 'file',
  }

}