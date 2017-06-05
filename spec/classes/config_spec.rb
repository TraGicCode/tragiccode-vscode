require 'spec_helper'
describe 'vscode::config' do
  context 'with default values for all parameters' do
    it { should contain_class('vscode') }
    it { should contain_class('vscode::config') }

    it { should contain_file('~\AppData\Roaming\Code\User\settings.json').with({
        :ensure => 'file',
    })}

  end

end
