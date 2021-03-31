require 'spec_helper'

describe Puppet::Type.type('vscode_extension').provider(:cli) do
  let(:provider) { subject }
  let(:properties) do
    { ensure: nil }
  end
  let(:resource) { subject.new(properties) }

  it 'returns an array of instances' do
    expect(subject.instances).to be_instance_of(Array)
  end

  describe 'getter property methods' do
    it 'returns value for ensure property' do
      expect(resource.ensure).to eq(nil)
    end
  end

  describe 'setter property methods' do
    it 'allows setting of value for ensure property' do
      resource.ensure = 'value1'
      expect(resource.ensure).to eq('value1')
    end
  end
end
