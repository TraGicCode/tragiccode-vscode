require 'spec_helper'

describe 'vscode::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts.merge(appdata: 'C:\Users\tragiccode\AppData\Roaming')
      end

      context 'with default values for all parameters' do
        it { is_expected.to contain_class('vscode') }
        it { is_expected.to contain_class('vscode::config') }

        it { is_expected.to contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User').with_ensure('directory') }
        it { is_expected.to contain_file('C:\Users\tragiccode\AppData\Roaming\Code').with_ensure('directory') }
        it { is_expected.to contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User\settings.json').with_ensure('file') }

        it {
          is_expected.to contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User\settings.json').with(
            ensure: 'file',
          ).with_content(%r{// Managed by Puppet! Changes made manually may be lost.}).with_content(%r{"workbench\.iconTheme": ""}).with_content(%r{"workbench\.colorTheme": ""})
        }
      end

      context 'with icon_theme => vs-minimal' do
        let(:params) do
          {
            icon_theme: 'vs-minimal',
          }
        end

        it { is_expected.to contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User\settings.json').with(ensure: 'file').with_content(%r{"workbench\.iconTheme": "vs-minimal"}) }
      end

      context 'with icon_theme => vs-seti' do
        let(:params) do
          {
            icon_theme: 'vs-seti',
          }
        end

        it { is_expected.to contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User\settings.json').with(ensure: 'file').with_content(%r{"workbench\.iconTheme": "vs-seti"}) }
      end

      context 'with color_theme => Monokai Dimmed' do
        let(:params) do
          {
            color_theme: 'Monokai Dimmed',
          }
        end

        it { is_expected.to contain_file('C:\Users\tragiccode\AppData\Roaming\Code\User\settings.json').with(ensure: 'file').with_content(%r{"workbench\.colorTheme": "Monokai Dimmed"}) }
      end
    end
  end
end
