Puppet::Type.type(:vscode_extension).provide(:cli) do
  commands code:       if File.exist?("#{ENV['SYSTEMDRIVE']}\\Program Files\\Microsoft VS Code\\bin\\code.cmd")
                         "#{ENV['SYSTEMDRIVE']}\\Program Files\\Microsoft VS Code\\bin\\code.cmd"
                       else
                         'code'
                       end
  # The code CLI tool doesn't properly return exit codes.  Therefore
  # i need to wrap the executable call and do a pattern match on the output
  # to check if an error occurs or not.
  def self._code(*args)
    output = code(args)
    if output.include?('Error')
      raise Puppet::ExecutionFailure, output
    end
    output
  end

  # Initializes property_hash
  def self.instances
    extensions = _code('--list-extensions').downcase.split("\n")
    extensions.map do |extension|
      new(ensure: :present,
          name:   extension)
    end
  end

  # Pairs the RAL Resources ( Type instances in catalog )
  # With the provider instances ( returned from self.instances )
  def self.prefetch(resources)
    instances.each do |prov|
      resource = resources[prov.name]
      if resource
        resource.provider = prov
      end
    end
  end

  def exists?
    Puppet.debug("Checking if #{resource[:name]} exists")
    @property_hash[:ensure] == :present
  end

  def create
    Puppet.debug("Creating #{resource[:name]}")
    self.class._code('--install-extension', resource[:name])
    @property_hash[:ensure] = :present
  end

  def destroy
    Puppet.debug("Deleting #{resource[:name]}")
    self.class._code('--uninstall-extension', resource[:name])
    @property_hash.clear
  end
end
