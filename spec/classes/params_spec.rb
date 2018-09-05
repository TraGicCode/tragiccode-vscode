require 'spec_helper'

describe 'vscode::params' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts.merge(appdata: 'C:\Users\tragiccode\AppData\Roaming')
      end

      context 'with default values for all parameters' do
        it { is_expected.to contain_class('vscode::params') }
        # This is a params class....
        it { is_expected.to have_resource_count(0) }
      end
    end
  end
end
