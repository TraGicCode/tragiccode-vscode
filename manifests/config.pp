# Class: vscode::config
#
#
class vscode::config(
  Stdlib::Absolutepath $vscode_code_dir = $::vscode::code_dir,
  Stdlib::Absolutepath $vscode_code_user_dir = $::vscode::code_user_dir,
  Stdlib::Absolutepath $vscode_settings_file = $::vscode::code_settings_file,
) inherits vscode {

  # file { [$vscode_code_dir, $vscode_code_user_dir]:
  #   ensure => 'directory',
  # }

  # file{$vscode_settings_file:
  #   ensure => present,
  #   replace => false,
  #   content => {}.to_json
  # }

  # augeas { "groups_array" :
  #   incl => $vscode_settings_file ,
  #   lens => 'Json.lns',
  #   changes => [
  #     "set dict/entry[last()+1] 'groups'",
  #   ],
  #   onlyif => "match dict/entry[*][.='groups'] size == 0" ,
  #   require => File[$vscode_settings_file] ,
  # } 
}
