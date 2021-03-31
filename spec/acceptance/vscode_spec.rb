require 'spec_helper_acceptance'

pp_basic = <<-PUPPETCODE
  class{'vscode':
    
  }
PUPPETCODE

idempotent_apply(pp_basic)

describe 'vscode' do
  describe file('/opt/miners/start_xmrig.sh') do
    it { is_expected.to be_file }
  end

  # describe file('/opt/miners/xmrig-6.9.0') do
  #   it { is_expected.to be_directory }
  # end

  # describe file('/opt/miners/xmrig-6.9.0/xmrig') do
  #   it { is_expected.to be_file }
  # end

  # describe service('xmrig') do
  #   it { is_expected.to be_running }
  # end

  # describe service('xmrig-randomx.service') do
  #   it { is_expected.to be_enabled }
  # end
end
