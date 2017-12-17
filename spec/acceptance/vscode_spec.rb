require 'spec_helper_acceptance'

describe 'vscode' do
  context 'when installing with provided mandatory parameters' do
    let(:install_manifest) do
      <<-MANIFEST
          class { 'vscode':
              package_ensure => 'present',
          }
        MANIFEST
    end

    it 'runs without errors' do
      apply_manifest(install_manifest, catch_failures: true)
    end

    it 'is idempotent' do
      apply_manifest(install_manifest, catch_changes: true)
    end

    describe package('Microsoft Visual Studio Code') do
      it { is_expected.to be_installed }
    end

    describe file('C:\Windows\Temp\VSCodeSetup-x64-1.18.1.exe') do
      it { is_expected.to exist }
      it { is_expected.to be_file }
    end

    describe file('~\AppData\Roaming\Code\User\settings.json') do
      it { is_expected.to exist }
      it { is_expected.to be_file }
    end
  end

  context 'when uninstalling with provided mandatory parameters' do
    let(:uninstall_manifest) do
      <<-MANIFEST
          class { 'vscode':
              package_ensure => 'absent',
          }
        MANIFEST
    end

    it 'runs without errors' do
      apply_manifest(uninstall_manifest, catch_failures: true)
    end

    it 'is idempotent' do
      apply_manifest(uninstall_manifest, catch_changes: true)
    end

    describe package('Microsoft Visual Studio Code') do
      it { is_expected.not_to be_installed }
    end

    describe file('C:\Windows\Temp\VSCodeSetup-x64-1.18.1.exe') do
      it { is_expected.not_to exist }
    end
  end
end
