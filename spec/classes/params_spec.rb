require 'spec_helper'

describe 'vscode::params' do
  context 'with default values for all parameters' do
    let(:facts) do
      {
        appdata: 'C:\Users\tragiccode\AppData\Roaming',
      }
    end

    it { is_expected.to contain_class('vscode::params') }
    # This is a params class....
    it { is_expected.to have_resource_count(0) }
  end
end
