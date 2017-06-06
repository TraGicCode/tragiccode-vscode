# Define: vscode::extension
# Parameters:
#
#
define vscode::extension (
    $extension_name = $title,
    Enum['present', 'installed', 'absent'] $ensure = 'present',
) {
    if $ensure != 'absent' {
      exec { "install-vscode-extension-${extension_name}":
        command   => "code.cmd --install-extension ${extension_name}",
        unless    => "cmd.exe /c \"code.cmd --list-extensions --show-versions | findstr.exe ${extension_name}\"",
        path      => 'C:/Windows/System32;C:/Program Files (x86)/Microsoft VS Code/bin',
        logoutput => true,
      }
    } else {
      exec { "uninstall-vscode-extension-${extension_name}":
        command   => "code.cmd --uninstall-extension ${extension_name}",
        onlyif    => "cmd.exe /c \"code.cmd --list-extensions --show-versions | findstr.exe ${extension_name}\"",
        path      => 'C:/Windows/System32;C:/Program Files (x86)/Microsoft VS Code/bin',
        logoutput => true,
      }
  }
}