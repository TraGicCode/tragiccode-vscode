require 'spec_helper'
require 'facter'
require 'facter/appdata'

describe :appdata, type: :fact do
  subject(:fact) { Facter.fact(subject) }

  before :all do
    # perform any action that should be run for the entire test suite
  end

  before :each do
    # perform any action that should be run before every test
    Facter.clear
  end

  it 'windows' do
    allow(Facter.fact(:kernel)).to receive(:value).and_return('windows')
    allow(ENV).to receive(:fetch).with('APPDATA', nil).and_return('C:\Users\tragiccode\AppData\Roaming')
    expect(Facter.fact(:appdata).value).to eq('C:\Users\tragiccode\AppData\Roaming')
  end

  it 'darwin' do
    allow(Facter.fact(:kernel)).to receive(:value).and_return('darwin')
    allow(ENV).to receive(:fetch).with('HOME', nil).and_return('/Users/user1')
    expect(Facter.fact(:appdata).value).to eq('/Users/user1/Library/Application Support')
  end

  it 'linux' do
    allow(Facter.fact(:kernel)).to receive(:value).and_return('Linux')
    allow(ENV).to receive(:fetch).with('HOME', nil).and_return('/home/user1')
    expect(Facter.fact(:appdata).value).to eq('/home/user1/.config')
  end
end
