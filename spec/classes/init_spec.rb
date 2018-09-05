require 'spec_helper'
describe 'vscode' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts.merge(appdata: 'C:\Users\tragiccode\AppData\Roaming')
      end

      context 'with default values for all parameters' do
        it { is_expected.to contain_class('vscode') }
        it { is_expected.to contain_class('vscode::config').that_requires('Class[vscode::install]') }
      end
    end
  end
end
