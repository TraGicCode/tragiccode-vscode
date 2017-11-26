Puppet::Type.newtype(:vscode_extension) do

    @doc = 'Puppet type that manages vscode extensions.'

    newproperty(:ensure, :parent => Puppet::Property::Ensure) do
        desc 'Specifies whether the extension should be present or absent.'
    
        newvalue(:present) do
            provider.create
        end

        newvalue(:installed) do
            provider.create
        end
    
        newvalue(:absent) do
            provider.destroy
        end
    end

    newparam(:extension_name, namevar: true) do
        desc 'The name of the extension.'
    end


end