require 'facter'

Facter.add(:appdata) do
  setcode do
    case Facter.value(:kernel)
    when 'windows'
      ENV.fetch('APPDATA', nil)
    when 'darwin'
      File.join(ENV.fetch('HOME', nil), 'Library', 'Application Support')
    else
      File.join(ENV.fetch('HOME', nil), '.config')
    end
  end
end
