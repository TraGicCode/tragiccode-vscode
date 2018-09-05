require 'spec_helper'

def vscode_extension_factory(params = {})
  defaults = {
    ensure: :present,
    extension_name: 'ms-vscode.PowerShell',
  }
  described_class.new(**defaults.merge(params))
end

describe Puppet::Type.type(:vscode_extension) do
  subject(:vscode_extension) { vscode_extension_factory }

  describe 'parameter :extension_name' do
    it 'is a parameter' do
      expect(described_class.attrtype(:extension_name)).to eq(:param)
    end

    it 'is the namevar' do
      expect(vscode_extension.parameters[:extension_name]).to be_isnamevar
    end

    it 'has documentation' do
      expect(described_class.attrclass(:extension_name).doc).not_to eq("\n\n")
    end

    it 'cannot be set to nil' do
      expect {
        vscode_extension[:extension_name] = nil
      }.to raise_error(Puppet::Error, %r{Got nil value for extension_name})
    end
    # This protects against
    # vscode_extension{ 's': ensure => present, extension_name => '', }
    it 'cannot be set to an empty string' do
      expect {
        vscode_extension[:extension_name] = ''
      }.to raise_error(Puppet::Error, %r{A non-empty extension_name must})
    end

    it 'can be set to a value following the (publisher name).(extension name) pattern' do
      expect {
        vscode_extension[:extension_name] = 'ms-vscode.PowerShell'
      }.not_to raise_error
    end

    it 'cannot be set to a value not following the (publisher name).(extension name) pattern' do
      expect {
        vscode_extension[:extension_name] = 'invalid-vscode-extension-name'
      }.to raise_error(Puppet::Error, %r{#{Regexp.escape('Extension names must following the (publisher name).(extension name) pattern')}})
    end
  end

  describe 'property :ensure' do
    it 'is a property' do
      expect(described_class.attrtype(:ensure)).to eq(:property)
    end

    it 'has Puppet::Property::Ensure as a parent' do
      expect(described_class.attrclass(:ensure).superclass).to eq(Puppet::Property::Ensure)
    end

    [:present, :installed, :absent].each do |ensure_value|
      it "can set be set to #{ensure_value}" do
        expect {
          vscode_extension[:ensure] = ensure_value
        }.not_to raise_error
      end
    end
  end
end
