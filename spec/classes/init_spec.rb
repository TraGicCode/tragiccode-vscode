require 'spec_helper'
describe 'vscode' do
  context 'with default values for all parameters' do
    let(:facts) {{
      :appdata => 'C:\Users\tragiccode\AppData\Roaming', 
    }}
    it { should contain_class('vscode') }
    it { should contain_class('vscode::config').that_requires('Class[vscode::install]') }
  end
end
