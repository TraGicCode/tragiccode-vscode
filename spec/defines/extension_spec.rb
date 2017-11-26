require 'spec_helper'

describe 'vscode::extension' do

    let(:title) {
        'jpogran.puppet-vscode'
    }

  context 'with ensure => present' do
    let(:params) {{
        :extension_name => 'jpogran.puppet-vscode',
    }}

    it { should contain_exec('install-vscode-extension-jpogran.puppet-vscode').with({
      :command   => 'code.cmd --install-extension jpogran.puppet-vscode',
      :unless    => 'cmd.exe /c "code.cmd --list-extensions --show-versions | findstr.exe jpogran.puppet-vscode"',
      :path      => 'C:/Windows/System32;C:/Program Files/Microsoft VS Code/bin',
      :logoutput => 'true',
      }) }
  end

  context 'with ensure => absent' do
    let(:params) {{
        :extension_name => 'jpogran.puppet-vscode',
        :ensure         => 'absent',
    }}

    it { should contain_exec('uninstall-vscode-extension-jpogran.puppet-vscode').with({
      :command   => 'code.cmd --uninstall-extension jpogran.puppet-vscode',
      :onlyif    => 'cmd.exe /c "code.cmd --list-extensions --show-versions | findstr.exe jpogran.puppet-vscode"',
      :path      => 'C:/Windows/System32;C:/Program Files/Microsoft VS Code/bin',
      :logoutput => 'true',
      }) }
  end
end