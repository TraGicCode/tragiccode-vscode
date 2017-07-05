require 'spec_helper'

describe 'vscode::extension' do

    let(:title) {
        'Bork.puppet'
    }

  context 'with ensure => present' do
    let(:params) {{
        :extension_name => 'Bork.puppet',
    }}

    it { should contain_exec('install-vscode-extension-Bork.puppet').with({
      :command   => 'code.cmd --install-extension Bork.puppet',
      :unless    => 'cmd.exe /c "code.cmd --list-extensions --show-versions | findstr.exe /i Bork.puppet"',
      :path      => 'C:/Windows/System32;C:/Program Files (x86)/Microsoft VS Code/bin',
      :logoutput => 'true',
      }) }
  end

  context 'with ensure => absent' do
    let(:params) {{
        :extension_name => 'Bork.puppet',
        :ensure         => 'absent',
    }}

    it { should contain_exec('uninstall-vscode-extension-Bork.puppet').with({
      :command   => 'code.cmd --uninstall-extension Bork.puppet',
      :onlyif    => 'cmd.exe /c "code.cmd --list-extensions --show-versions | findstr.exe /i Bork.puppet"',
      :path      => 'C:/Windows/System32;C:/Program Files (x86)/Microsoft VS Code/bin',
      :logoutput => 'true',
      }) }
  end
end