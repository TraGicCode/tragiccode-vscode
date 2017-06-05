# Class: vscode::install
#
#
class vscode::install(
  Enum['present', 'installed', 'absent'] $package_ensure = $::vscode::package_ensure,
  String $package_name = $::vscode::package_name,
  String $vscode_download_url = $::vscode::vscode_download_url,
  Stdlib::Absolutepath $vscode_download_absolute_path = $::vscode::vscode_download_absolute_path,
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

  package { $package_name:
    ensure          => $package_ensure,
    source          => $vscode_download_absolute_path,
    install_options => ['/verysilent'],
    require         => File[$vscode_download_absolute_path],
  }
}