# Class: vscode::params
#
#
class vscode::params {
    $package_ensure = 'present'
    $package_name   = 'visualstudiocode'
    $vscode_download_url = 'https://az764295.vo.msecnd.net/stable/19222cdc84ce72202478ba1cec5cb557b71163de/VSCodeSetup-1.12.2.exe'
    $vscode_download_absolute_path = 'C:\VSCodeSetup-1.12.2.exe'
    $disable_extensions = false
    $vscode_user_settings_file_absolute_path = '~\AppData\Roaming\Code\User\settings.json'
}