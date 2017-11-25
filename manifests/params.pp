# Class: vscode::params
#
#
class vscode::params {
    $package_ensure = 'present'
    $package_name   = 'Microsoft Visual Studio Code'
    $vscode_download_url = 'https://az764295.vo.msecnd.net/stable/929bacba01ef658b873545e26034d1a8067445e9/VSCodeSetup-x64-1.18.1.exe'
    $vscode_download_absolute_path = 'C:\Windows\Temp\VSCodeSetup-x64-1.18.1.exe'
    $disable_extensions = false
    $vscode_user_code_directory = "${facts[appdata]}\\Code"
    $vscode_user_user_directory = "${vscode_user_code_directory}\\User"
    $vscode_user_settings_file_absolute_path = "${vscode_user_user_directory}\\settings.json"
    $create_desktop_icon = true
    $create_quick_launch_icon = true
    $create_context_menu_files = true
    $create_context_menu_folders = true
    $add_to_path = true
    $icon_theme = undef
    $color_theme = undef
}
