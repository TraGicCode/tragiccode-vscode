# Class: vscode::params
#
#
class vscode::params {
    $package_ensure = 'present'
    $package_name   = 'visualstudiocode'
    $vscode_download_url = 'https://az764295.vo.msecnd.net/stable/19222cdc84ce72202478ba1cec5cb557b71163de/VSCodeSetup-1.12.2.exe'
    $vscode_download_absolute_path = 'C:\VSCodeSetup-1.12.2.exe'
    $disable_extensions = false
    $vscode_user_code_directory = "${facts[appdata]}\\Code"
    $vscode_user_user_directory = "${vscode_user_code_directory}\\User"
    $vscode_user_settings_file_absolute_path = "${vscode_user_user_directory}\\settings.json"
    $create_desktop_icon = true
    $create_quick_launch_icon = true
    $create_context_menu_files = true
    $create_context_menu_folders = true
    $add_to_path = true
}