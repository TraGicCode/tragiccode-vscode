def install_vscode(host)
  pp = <<-MANIFEST
    class { 'vscode':
        package_ensure => 'present',
    }
  MANIFEST
  apply_manifest_on(host, pp)
end

def uninstall_vscode(host)
  pp = <<-MANIFEST
    class { 'vscode':
        package_ensure => 'absent',
    }
  MANIFEST
  apply_manifest_on(host, pp)
end
