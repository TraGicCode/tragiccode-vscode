# Class: vscode::config
#
#
class vscode::config(
  Stdlib::Absolutepath $vscode_user_code_directory = $::vscode::vscode_user_code_directory,
  Stdlib::Absolutepath $vscode_user_user_directory = $::vscode::vscode_user_user_directory,
  Stdlib::Absolutepath $vscode_user_settings_file_absolute_path = $::vscode::vscode_user_settings_file_absolute_path,
  Optional[Enum['vs-minimal', 'vs-seti']] $icon_theme = $::vscode::icon_theme,
  Optional[String] $color_theme = $::vscode::color_theme,
) inherits vscode {

  file { [$vscode_user_code_directory, $vscode_user_user_directory]:
    ensure => 'directory',
  }

  file { $vscode_user_settings_file_absolute_path:
    ensure  => 'file',
    content => regsubst(epp("${module_name}/settings.json.epp", {
      'icon_theme'  => $icon_theme,
      'color_theme' => $color_theme,
    }), '\n', "\r\n", 'EMG'),
  }

}
