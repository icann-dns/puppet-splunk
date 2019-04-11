require 'spec_helper'

describe 'splunk::addon' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      if os.start_with?('windows')
        # Splunk Server not used supported on windows
      else
        context "on #{os}" do
          let(:facts) do
            facts
          end
          let(:title) { 'Splunk_TA' }
          let(:params) { { 'splunkbase_source' => 'puppet:///modules/profiles/splunk-add-on.tgz' } }

          it { is_expected.to compile.with_all_deps }
        end
      end
    end
  end
end
