require 'spec_helper'
describe 'vscode' do
  context 'with default values for all parameters' do
    it { should contain_class('vscode') }
  end
end
