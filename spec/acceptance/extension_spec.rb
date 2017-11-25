require 'spec_helper_acceptance'

describe 'vscode::extension' do
  # https://stackoverflow.com/questions/16617052/rails-rspec-before-all-vs-before-each
  before(:all) do
      host = find_only_one("agent")
      install_vscode(host)
  end

  after(:all) do
      host = find_only_one("agent")
      uninstall_vscode(host)
  end

  context 'when installing with provided mandatory parameters' do
    let(:install_manifest) {
      <<-MANIFEST
          vscode::extension { 'jpogran.puppet-vscode':
            ensure => 'present',
        }
        MANIFEST
    }

    it 'should run without errors' do
      apply_manifest(install_manifest, :catch_failures => true)
    end

    it 'should be idempotent' do
      apply_manifest(install_manifest, :catch_changes => true)
    end

    describe command('& "C:\Program Files\Microsoft VS Code\bin\code.cmd" --list-extensions --show-versions') do
       its(:stdout) { should match Regexp.escape('jpogran.puppet-vscode') }
    end

  end


  context 'when uninstalling with provided mandatory parameters' do
    let(:install_manifest) {
      <<-MANIFEST
          vscode::extension { 'jpogran.puppet-vscode':
            ensure => 'absent',
        }
        MANIFEST
    }

    it 'should run without errors' do
      apply_manifest(install_manifest, :catch_failures => true)
    end

    it 'should be idempotent' do
      apply_manifest(install_manifest, :catch_changes => true)
    end

    describe command('& "C:\Program Files\Microsoft VS Code\bin\code.cmd" --list-extensions --show-versions') do
       its(:stdout) { should_not match Regexp.escape('jpogran.puppet-vscode') }
    end

  end

end