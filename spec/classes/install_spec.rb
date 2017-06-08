require 'spec_helper'
describe 'vscode::install' do
    
  context 'with default values for all parameters' do
    let(:facts) {{
      :appdata => 'C:\Users\tragiccode\AppData\Roaming', 
    }}
    it { should contain_class('vscode') }
    it { should contain_class('vscode::install') }

    it { should contain_file('C:\Temp\VSCodeSetup-1.12.2.exe').with({
        :ensure => 'file',
        :source => 'https://az764295.vo.msecnd.net/stable/19222cdc84ce72202478ba1cec5cb557b71163de/VSCodeSetup-1.12.2.exe',
    })}

    it { should contain_package('Microsoft Visual Studio Code').with({
        :ensure            => 'present',
        :source            => 'C:\Temp\VSCodeSetup-1.12.2.exe',
        :install_options   => ['/verysilent', '/mergetasks=!runCode,desktopicon,quicklaunchicon,addcontextmenufiles,addcontextmenufolders,addtopath', { '/log' => 'C:\\VSCodeSetup-install.log', }],
        :uninstall_options => ['/verysilent'],
    }).that_requires('File[C:\Temp\VSCodeSetup-1.12.2.exe]')}

  end

  context 'with ensure => absent' do
    let(:facts) {{
      :appdata => 'C:\Users\tragiccode\AppData\Roaming', 
    }}
    let(:params) {{
        :package_ensure => 'absent',
    }}

    it { should contain_class('vscode') }
    it { should contain_class('vscode::install') }

    it { should contain_file('C:\Temp\VSCodeSetup-1.12.2.exe').with({
        :ensure => 'absent',
        :source => 'https://az764295.vo.msecnd.net/stable/19222cdc84ce72202478ba1cec5cb557b71163de/VSCodeSetup-1.12.2.exe',
    })}

    it { should contain_package('Microsoft Visual Studio Code').with({
        :ensure => 'absent',
        :source => 'C:\Temp\VSCodeSetup-1.12.2.exe',
    }).that_requires('File[C:\Temp\VSCodeSetup-1.12.2.exe]')}

  end
end
