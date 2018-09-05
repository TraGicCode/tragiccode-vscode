# Class: vscode::install
#
#
class vscode::install(
  Enum['present', 'installed', 'absent'] $package_ensure = $::vscode::package_ensure,
  String $package_name = $::vscode::package_name,
  String $vscode_download_url = $::vscode::vscode_download_url,
  Stdlib::Absolutepath $vscode_download_absolute_path = $::vscode::vscode_download_absolute_path,
  Boolean $create_desktop_icon = $::vscode::create_desktop_icon,
  Boolean $create_quick_launch_icon = $::vscode::create_quick_launch_icon,
  Boolean $create_context_menu_files = $::vscode::create_context_menu_files,
  Boolean $create_context_menu_folders = $::vscode::create_context_menu_folders,
  Boolean $add_to_path = $::vscode::add_to_path,
) inherits vscode {

  $file_ensure = $package_ensure ? {
    'installed' => 'file',
    'present'   => 'file',
    default     => 'absent',
  }

  file { $vscode_download_absolute_path:
    ensure => $file_ensure,
    source => $vscode_download_url,
  }

  $_string_create_desktop_icon = $create_desktop_icon ? {
    false   => '!desktopicon',
    default => 'desktopicon',
  }

  $_string_create_quick_launch_icon = $create_quick_launch_icon ? {
    false   => '!quicklaunchicon',
    default => 'quicklaunchicon',
  }

  $_string_create_context_menu_files = $create_context_menu_files ? {
    false   => '!addcontextmenufiles',
    default => 'addcontextmenufiles',
  }

  $_string_create_context_menu_folders = $create_context_menu_folders ? {
    false   => '!addcontextmenufolders',
    default => 'addcontextmenufolders',
  }


  $_string_add_to_path = $add_to_path ? {
    false   => '!addtopath',
    default => 'addtopath',
  }

  package { $package_name:
    ensure            => $package_ensure,
    source            => $vscode_download_absolute_path,
    install_options   => [
      '/verysilent',
      # lint:ignore:140chars
      "/mergetasks=!runCode,${_string_create_desktop_icon},${_string_create_quick_launch_icon},${_string_create_context_menu_files},${_string_create_context_menu_folders},${_string_add_to_path}",
      # lint:endignore
      { '/log' => 'C:\\VSCodeSetup-install.log', }
    ],
    uninstall_options => ['/verysilent'],
    require           => File[$vscode_download_absolute_path],
  }
}
