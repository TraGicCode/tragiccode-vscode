require 'spec_helper'
describe 'vscode' do
  context 'with default values for all parameters' do
    let(:facts) do
      {
        appdata: 'C:\Users\tragiccode\AppData\Roaming',
      }
    end

    it { is_expected.to contain_class('vscode') }
    it { is_expected.to contain_class('vscode::config').that_requires('Class[vscode::install]') }
  end
end
