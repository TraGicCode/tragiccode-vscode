require 'spec_helper_acceptance'

describe 'vscode' do

  context 'when installing with provided mandatory parameters' do
    let(:install_manifest) {
      <<-MANIFEST
          class { 'vscode':
              package_ensure => 'present',
          }
        MANIFEST
    }

    it 'should run without errors' do
      apply_manifest(install_manifest, :catch_failures => true)
    end

    it 'should be idempotent' do
      apply_manifest(install_manifest, :catch_changes => true)
    end

    describe package('Microsoft Visual Studio Code') do
      it { should be_installed }
    end

    describe file('C:\VSCodeSetup-1.12.2.exe') do
       it { should exist }
       it { should be_file }
    end

  end

  context 'when uninstalling with provided mandatory parameters' do
    let(:uninstall_manifest) {
      <<-MANIFEST
          class { 'vscode':
              package_ensure => 'absent',
          }
        MANIFEST
    }

    it 'should run without errors' do
      apply_manifest(uninstall_manifest, :catch_failures => true)
    end

    it "should be idempotent" do
      apply_manifest(uninstall_manifest, :catch_changes => true)
    end

    describe package('Microsoft Visual Studio Code') do
      it { should_not be_installed }
    end
    
    describe file('C:\VSCodeSetup-1.12.2.exe') do
       it { should_not exist }
    end


  end

end