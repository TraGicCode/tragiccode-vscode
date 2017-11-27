# vscode

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with vscode](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vscode](#beginning-with-vscode)
1. [Usage - Configuration options and additional functionality](#usage)
    * [Install vscode only](#install_vscode_only)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The vscode module installs and manages microsoft's visualstudio code, it's extensions, and user preference settings on Windows systems.

visualstudio code is an ide used by developers to write code.

## Setup

### Setup Requirements

The vscode module requires the following:

* Puppet Agent 4.0 or later.
* Access to the internet.
* Windows Server 8 and up.

### Beginning with vscode

**NOTE: The vscode class currently only works on windows.**

To get started with the vscode module simply include the following in your manifest:

```puppet
class { 'vscode':
    package_ensure => 'present',
}
```

This example downloads and installs vscode version 1.12.2.  After running this you be have visual studio code installed and ready to go.


A more advanced configuration including all attributes available:

```puppet
class { 'vscode':
   package_ensure                => 'present',
   vscode_download_url           => 'https://company-name.s3.amazonaws.com/binaries/vscode-latest.exe',
   vscode_download_absolute_path => 'C:\\Windows\\Temp',
   create_desktop_icon           => true,
   create_quick_launch_icon      => true,
   create_context_menu_files     => true,
   create_context_menu_folders   => true,
   add_to_path                   => true,
   icon_theme                    => 'vs-seti',
   color_theme                   => 'Monokai Dimmed',
 }
```

The above is just an example of the flexibility you have with this module.  You will generally never need to specify every or even so many parameters as shown since the defaults for installation apply almost every feature available during install time.  The one parameter you might use is the vscode_download_url.  This will allow you to another http url to download vscode from that is not pinned to version 1.12.2 like this module from microsoft's visualstudio code download page.


## Usage

### Install vscode an extension

Lets look at an example of installing visual studio code along with installing a plugin to help you with puppet development

```puppet
class { 'vscode':
    package_ensure => 'present',
}

vscode_extension { 'Borke.puppet':
  ensure  => 'present',
  require => Class['vscode'],
}
```

### Uninstall a vscode extension
```puppet
class { 'vscode':
    package_ensure => 'present',
}

vscode_extension { 'Borke.puppet':
  ensure  => 'absent',
  require => Class['vscode'],
}
```

### Customize color them and icon theme
```puppet
class { 'vscode':
    package_ensure => 'present',
    color_theme    => 'Monokai Dimmed',
    icon_theme     => 'vs-seti',
}

```

## Reference

### Classes

Parameters are optional unless otherwise noted.

#### `vscode`

Installs and configures visual studio code based on user preferences/settings.

#### `package_ensure`

Specifies whether the visualstudiocode package resource should be present. Valid options: 'present', 'installed' and 'absent'.

Default: 'present'.

#### `vscode_download_url`

http/https url in which a visualstudiocode installer can be downloaded.

Default: 'https://az764295.vo.msecnd.net/stable/19222cdc84ce72202478ba1cec5cb557b71163de/VSCodeSetup-1.12.2.exe'

#### `vscode_download_absolute_path`

The location in which to store the downloaded vscode installer at on the filesystem.

Default: 'C:\Temp\VSCodeSetup-1.12.2.exe'

#### `create_desktop_icon`

Specifies whether to create an icon/shortcut for visualstudiocode on the user's desktop.

Default: true.

#### `create_quick_launch_icon`

Specifies whether to add visualstudiocode on the user's quicklaunch section of their taskbar.

Default: true.

#### `create_context_menu_files`

Specifies whether to add the open in code context menu item when a user right clicks a file.

Default: true.

#### `create_context_menu_folders`

Specifies whether to add the open in code context menu item when a user right clicks a folder.

Default: true.

#### `add_to_path`

Specifies whether to add the bin directory of visualstudio code to the user's system path.

Default: true.

#### `color_theme`

Specifies which color theme should be used in vscode.

Default: undef.

#### `icon_theme`

Specifies which icon theme should be used in vscode.

Default: undef.

### Types

Parameters are optional unless otherwise noted.

#### `vscode::extension`

Installs visual studio code extensions published by the community.

#### `ensure`

Specifies whether the visualstudiocode extension should be present. Valid options: 'present', 'installed' and 'absent'.

Default: 'present'.

##### `extension_name`

Specifies a visualstudiocode extension to manage. Valid options: a string containing the name of an existing visualstudiocode extension.

Default: the title of your declared resource.

## Limitations

This module is only available for Windows 8 and up and works with Puppet 4.0 and later.

## Development

## Contributing

1. Fork it ( https://github.com/tragiccode/tragiccode-vscode/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
