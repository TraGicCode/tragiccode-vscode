# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`vscode`](#vscode): Class: vscode ===========================  Full description of class vscode here.  Parameters ----------  Document parameters here.  [*ensure
* [`vscode::config`](#vscode--config): Class: vscode::config
* [`vscode::install`](#vscode--install): Class: vscode::install
* [`vscode::params`](#vscode--params): Class: vscode::params

### Resource types

* [`vscode_extension`](#vscode_extension): Puppet type that manages vscode extensions.

## Classes

### <a name="vscode"></a>`vscode`

Class: vscode
===========================

Full description of class vscode here.

Parameters
----------

Document parameters here.

[*ensure*]
  Ensure parameter passed onto Service[] resources.
  Default: running

Authors
-------

Author Name <michael@tragiccode.com>

Copyright
---------

Copyright 2017

#### Examples

##### 

```puppet
class { 'vscode':
  package_ensure => 'present',
}
```

#### Parameters

The following parameters are available in the `vscode` class:

* [`package_ensure`](#-vscode--package_ensure)
* [`package_name`](#-vscode--package_name)
* [`vscode_download_url`](#-vscode--vscode_download_url)
* [`vscode_download_absolute_path`](#-vscode--vscode_download_absolute_path)
* [`disable_extensions`](#-vscode--disable_extensions)
* [`create_desktop_icon`](#-vscode--create_desktop_icon)
* [`create_quick_launch_icon`](#-vscode--create_quick_launch_icon)
* [`create_context_menu_files`](#-vscode--create_context_menu_files)
* [`create_context_menu_folders`](#-vscode--create_context_menu_folders)
* [`add_to_path`](#-vscode--add_to_path)
* [`vscode_user_code_directory`](#-vscode--vscode_user_code_directory)
* [`vscode_user_user_directory`](#-vscode--vscode_user_user_directory)
* [`vscode_user_settings_file_absolute_path`](#-vscode--vscode_user_settings_file_absolute_path)
* [`icon_theme`](#-vscode--icon_theme)
* [`color_theme`](#-vscode--color_theme)

##### <a name="-vscode--package_ensure"></a>`package_ensure`

Data type: `Enum['present', 'installed', 'absent']`



Default value: `$vscode::params::package_ensure`

##### <a name="-vscode--package_name"></a>`package_name`

Data type: `String`



Default value: `$vscode::params::package_name`

##### <a name="-vscode--vscode_download_url"></a>`vscode_download_url`

Data type: `String`



Default value: `$vscode::params::vscode_download_url`

##### <a name="-vscode--vscode_download_absolute_path"></a>`vscode_download_absolute_path`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::params::vscode_download_absolute_path`

##### <a name="-vscode--disable_extensions"></a>`disable_extensions`

Data type: `Boolean`



Default value: `$vscode::params::disable_extensions`

##### <a name="-vscode--create_desktop_icon"></a>`create_desktop_icon`

Data type: `Boolean`



Default value: `$vscode::params::create_desktop_icon`

##### <a name="-vscode--create_quick_launch_icon"></a>`create_quick_launch_icon`

Data type: `Boolean`



Default value: `$vscode::params::create_quick_launch_icon`

##### <a name="-vscode--create_context_menu_files"></a>`create_context_menu_files`

Data type: `Boolean`



Default value: `$vscode::params::create_context_menu_files`

##### <a name="-vscode--create_context_menu_folders"></a>`create_context_menu_folders`

Data type: `Boolean`



Default value: `$vscode::params::create_context_menu_folders`

##### <a name="-vscode--add_to_path"></a>`add_to_path`

Data type: `Boolean`



Default value: `$vscode::params::add_to_path`

##### <a name="-vscode--vscode_user_code_directory"></a>`vscode_user_code_directory`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::params::vscode_user_code_directory`

##### <a name="-vscode--vscode_user_user_directory"></a>`vscode_user_user_directory`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::params::vscode_user_user_directory`

##### <a name="-vscode--vscode_user_settings_file_absolute_path"></a>`vscode_user_settings_file_absolute_path`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::params::vscode_user_settings_file_absolute_path`

##### <a name="-vscode--icon_theme"></a>`icon_theme`

Data type: `Optional[Enum['vs-minimal', 'vs-seti']]`



Default value: `$vscode::params::icon_theme`

##### <a name="-vscode--color_theme"></a>`color_theme`

Data type: `Optional[String]`



Default value: `$vscode::params::color_theme`

### <a name="vscode--config"></a>`vscode::config`

Class: vscode::config

#### Parameters

The following parameters are available in the `vscode::config` class:

* [`vscode_user_code_directory`](#-vscode--config--vscode_user_code_directory)
* [`vscode_user_user_directory`](#-vscode--config--vscode_user_user_directory)
* [`vscode_user_settings_file_absolute_path`](#-vscode--config--vscode_user_settings_file_absolute_path)
* [`icon_theme`](#-vscode--config--icon_theme)
* [`color_theme`](#-vscode--config--color_theme)

##### <a name="-vscode--config--vscode_user_code_directory"></a>`vscode_user_code_directory`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::vscode_user_code_directory`

##### <a name="-vscode--config--vscode_user_user_directory"></a>`vscode_user_user_directory`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::vscode_user_user_directory`

##### <a name="-vscode--config--vscode_user_settings_file_absolute_path"></a>`vscode_user_settings_file_absolute_path`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::vscode_user_settings_file_absolute_path`

##### <a name="-vscode--config--icon_theme"></a>`icon_theme`

Data type: `Optional[Enum['vs-minimal', 'vs-seti']]`



Default value: `$vscode::icon_theme`

##### <a name="-vscode--config--color_theme"></a>`color_theme`

Data type: `Optional[String]`



Default value: `$vscode::color_theme`

### <a name="vscode--install"></a>`vscode::install`

Class: vscode::install

#### Parameters

The following parameters are available in the `vscode::install` class:

* [`package_ensure`](#-vscode--install--package_ensure)
* [`package_name`](#-vscode--install--package_name)
* [`vscode_download_url`](#-vscode--install--vscode_download_url)
* [`vscode_download_absolute_path`](#-vscode--install--vscode_download_absolute_path)
* [`create_desktop_icon`](#-vscode--install--create_desktop_icon)
* [`create_quick_launch_icon`](#-vscode--install--create_quick_launch_icon)
* [`create_context_menu_files`](#-vscode--install--create_context_menu_files)
* [`create_context_menu_folders`](#-vscode--install--create_context_menu_folders)
* [`add_to_path`](#-vscode--install--add_to_path)

##### <a name="-vscode--install--package_ensure"></a>`package_ensure`

Data type: `Enum['present', 'installed', 'absent']`



Default value: `$vscode::package_ensure`

##### <a name="-vscode--install--package_name"></a>`package_name`

Data type: `String`



Default value: `$vscode::package_name`

##### <a name="-vscode--install--vscode_download_url"></a>`vscode_download_url`

Data type: `String`



Default value: `$vscode::vscode_download_url`

##### <a name="-vscode--install--vscode_download_absolute_path"></a>`vscode_download_absolute_path`

Data type: `Stdlib::Absolutepath`



Default value: `$vscode::vscode_download_absolute_path`

##### <a name="-vscode--install--create_desktop_icon"></a>`create_desktop_icon`

Data type: `Boolean`



Default value: `$vscode::create_desktop_icon`

##### <a name="-vscode--install--create_quick_launch_icon"></a>`create_quick_launch_icon`

Data type: `Boolean`



Default value: `$vscode::create_quick_launch_icon`

##### <a name="-vscode--install--create_context_menu_files"></a>`create_context_menu_files`

Data type: `Boolean`



Default value: `$vscode::create_context_menu_files`

##### <a name="-vscode--install--create_context_menu_folders"></a>`create_context_menu_folders`

Data type: `Boolean`



Default value: `$vscode::create_context_menu_folders`

##### <a name="-vscode--install--add_to_path"></a>`add_to_path`

Data type: `Boolean`



Default value: `$vscode::add_to_path`

### <a name="vscode--params"></a>`vscode::params`

Class: vscode::params

## Resource types

### <a name="vscode_extension"></a>`vscode_extension`

Puppet type that manages vscode extensions.

#### Properties

The following properties are available in the `vscode_extension` type.

##### `ensure`

Valid values: `present`, `installed`, `absent`

Specifies whether the extension should be present or absent.

#### Parameters

The following parameters are available in the `vscode_extension` type.

* [`extension_name`](#-vscode_extension--extension_name)
* [`provider`](#-vscode_extension--provider)

##### <a name="-vscode_extension--extension_name"></a>`extension_name`

The name of the extension.

##### <a name="-vscode_extension--provider"></a>`provider`

The specific backend to use for this `vscode_extension` resource. You will seldom need to specify this --- Puppet will
usually discover the appropriate provider for your platform.

