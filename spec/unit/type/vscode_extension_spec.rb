require 'spec_helper'

describe 'vscode_extension' do
    # This gets the type but doesn't create an instance.  This is asking for the actual class for our type
    # In ou case this is Puppet::Type::Vscode_extension
    #  Puppet::Type.type(:vscode_extension).new(name: 't')
    let(:type_class) { Puppet::Type.type(:vscode_extension) }
    let(:parameters) { [ :extension_name ] }
    let(:properties) { [ :ensure ] }

    it 'should have expected parameters' do
        parameters.each do |parameter|
            expect(type_class.parameters).to include(parameter)
        end
    end

    it 'should have expected properties' do
        properties.each do |property|
            expect(type_class.properties.map(&:name)).to be_include(property)
        end
    end

    [:present, :installed, :absent].each do |value|
        it "should accept #{value} as a value for :ensure" do
            expect(type_class.new(name: 'test', ensure: value)) # Notice this actually creates an instance of the type
        end
    end

end