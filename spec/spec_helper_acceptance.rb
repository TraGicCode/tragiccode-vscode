require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'
require 'vscode_testing_helpers'
require 'beaker/module_install_helper'

run_puppet_install_helper
install_module
install_module_dependencies

# Install additional modules for soft deps
# install_module_from_forge('puppetlabs-java', '>= 2.1.0 < 3.0.0')

RSpec.configure do |c|
  c.formatter = :documentation
end
