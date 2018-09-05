require 'spec_helper'
describe 'vscode::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts.merge(appdata: 'C:\Users\tragiccode\AppData\Roaming')
      end

      context 'with default values for all parameters' do
        it { is_expected.to contain_class('vscode') }
        it { is_expected.to contain_class('vscode::install') }

        it {
          is_expected.to contain_file('C:\Windows\Temp\VSCodeSetup-x64-1.18.1.exe').with(
            ensure: 'file',
            source: 'https://az764295.vo.msecnd.net/stable/929bacba01ef658b873545e26034d1a8067445e9/VSCodeSetup-x64-1.18.1.exe',
          )
        }

        it {
          is_expected.to contain_package('Microsoft Visual Studio Code').with(
            ensure: 'present',
            source: 'C:\Windows\Temp\VSCodeSetup-x64-1.18.1.exe',
            install_options: ['/verysilent', '/mergetasks=!runCode,desktopicon,quicklaunchicon,addcontextmenufiles,addcontextmenufolders,addtopath', { '/log' => 'C:\\VSCodeSetup-install.log' }],
            uninstall_options: ['/verysilent'],
          ).that_requires('File[C:\Windows\Temp\VSCodeSetup-x64-1.18.1.exe]')
        }
      end

      context 'with ensure => absent' do
        let(:facts) do
          {
            appdata: 'C:\Users\tragiccode\AppData\Roaming',
          }
        end
        let(:params) do
          {
            package_ensure: 'absent',
          }
        end

        it { is_expected.to contain_class('vscode') }
        it { is_expected.to contain_class('vscode::install') }
        it { is_expected.to contain_file('C:\Windows\Temp\VSCodeSetup-x64-1.18.1.exe').with_ensure('absent') }
        it { is_expected.to contain_package('Microsoft Visual Studio Code').with_ensure('absent') }
      end
    end
  end
end
