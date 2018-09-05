require 'facter'

Facter.add(:appdata) do
  confine kernel: :windows
  setcode do
    ENV['APPDATA']
  end
end
