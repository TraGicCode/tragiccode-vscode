require 'spec_helper'

# find all parameters that don't have default values and put in here
# ensure validation occurs
describe Puppet::Type.type(:vscode_extension) do
  # these should be only the require parameters
  let(:required_properties) do
    {

      name: 'some_name'
    }
  end

  let(:optional_properties) do
    {

    }
  end

  let(:properties) do
    required_properties.merge(optional_properties)
  end

  let(:name) do
    'some_name'
  end

  let(:type_instance) do
    #
    Puppet::Type.type(:vscode_extension).new(name: name)
  end

  describe :extension_name do
    it 'has a extension_name parameter' do
      expect(Puppet::Type.type(:vscode_extension).attrtype(:extension_name)).to eq(:param)
    end
    it 'raises ArgumentError if not valid value' do
      expect {
        Puppet::Type.type(:vscode_extension).new(name: name, ensure: :present, extension_name: 'some_bad_value')
      }.to raise_error(Puppet::ResourceError)
    end
    it 'validates and pass if valid value' do
      expect(Puppet::Type.type(:vscode_extension).new(name: name, ensure: :present, extension_name: 'some_value')).to eq('')
    end
  end

  describe :ensure do
    it 'has a ensure property' do
      expect(Puppet::Type.type(:vscode_extension).attrtype(:ensure)).to eq(:property)
    end
    it 'raises ArgumentError if not valid value' do
      expect {
        Puppet::Type.type(:vscode_extension).new(name: name, ensure: :present)
      }.to raise_error(Puppet::ResourceError)
    end
    it 'validates and pass if valid value' do
      expect(Puppet::Type.type(:vscode_extension).new(name: name, ensure: :present)).to eq('')
    end
  end
end
