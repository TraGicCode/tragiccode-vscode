class vscode::install(
  Boolean $manage_package = $::vscode::manage_package,
  Boolean $manage_repo = $::vscode::manage_repo,
  Stdlib::HttpUrl $package_repo_url = $::vscode::package_repo_url,
  Enum['present', 'absent'] $package_ensure = present,
  Optional[Stdlib::HttpUrl] $package_source_url = undef,
) {
  case $facts['os']['family'] {
    'RedHat': {
      yumrepo { 'vscode.repo':
        ensure   => $package_ensure,
        enabled  => 1,
        descr    => 'VSCode repo',
        baseurl  => $package_repo_url,
        gpgcheck => 1,
        gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc',
      }

      package { 'code':
        ensure  => $package_ensure,
        require => [
          Yumrepo['vscode.repo'],
        ],
      }
    }
    'Darwin': {
      archive { '/tmp/VSCode_universal.zip':
        ensure => $package_ensure,
        extract => true,
        cleanup => true,
        extract_path => '/Applications',
        creates => '/Applications/Visual Studio Code.app',
        source => $package_source_url,
      }
    }

    'Debian': {
      archive{'Download Microsoft VS Code gpg key':
        ensure  => $package_ensure,
        path    => '/tmp/microsoft.asc',
        source  => 'https://packages.microsoft.com/keys/microsoft.asc',
        creates => '/etc/apt/trusted.gpg.d/microsoft.gpg',
        notify  => Exec['create microsoft.gpg']
      }

      exec { 'create microsoft.gpg':
        command => 'gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg /tmp/microsoft.asc',
        path    => ['/usr/bin', '/usr/sbin'],
        creates => '/etc/apt/trusted.gpg.d/microsoft.gpg',
        refreshonly => true,
      }

      apt::source { 'vscode':
        ensure   => $package_ensure,
        comment  => 'This is the official VSCode repository',
        location => $package_repo_url,
        release  => 'stable',
        repos    => 'main',
        include  => {
          'deb' => true,
        },
      }

      package { 'code':
        ensure  => $package_ensure,
        require => [
          Apt::Source['vscode'],
        ],
      }
    }

    'Windows': {
      file { '/c/windows/temp/VSCode.exe':
        ensure => $package_ensure,
        source => $package_source_url,
      }

      package { 'code':
        ensure          => $package_ensure,
        source          => '/c/windows/temp/VSCode.exe',
        install_options => ['/verysilent', { '/log' => 'C:\\VSCode-install.log', }],
        require         => File['/c/windows/temp/VSCode.exe'],
      }
    }

    default: {
      notify { 'OS not supported': }
    }
  }
}
