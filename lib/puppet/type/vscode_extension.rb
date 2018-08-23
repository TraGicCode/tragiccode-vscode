
Puppet::Type.newtype(:vscode_extension) do
  @doc = 'Puppet type that manages vscode extensions.'

  newproperty(:ensure, parent: Puppet::Property::Ensure) do
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
  # (publisher name).(extension name)
  # ms-vscode.PowerShell
  newparam(:extension_name, namevar: true) do
    desc 'The name of the extension.'
    validate do |value|
      raise('A non-empty extension_name must be specified.') if value.empty? || value.nil?
      # https://github.com/Microsoft/vscode-generator-code/blob/master/generators/app/validator.js
      raise('Extension names must following the (publisher name).(extension name) pattern') if value !~ %r{^[a-z0-9][a-z0-9\-]*\.[a-z0-9][a-z0-9\-]*$}i
    end
  end
end
