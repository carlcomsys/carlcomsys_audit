#
# Cookbook:: carlcomsys_audit
# Spec:: default_spec
#
# maintainer:: Aig Cloud Team
# maintainer_email:: aigcloudautomations@aig.com
#
# Copyright:: 2017, Aig Cloud Team, All Rights Reserved.

require 'spec_helper'

describe 'carlcomsys_audit::default' do
  context 'Validate supported installations' do
    platforms = {
      'redhat' => {
        'versions' => %w(6.8 7.2 7.3)
      },
      'centos' => {
        'versions' => %w(6.8 7.2.1511 7.3.1611)
      },
      'ubuntu' => {
        'versions' => %w(14.04 16.04)
      }
    }
    platforms.each do |platform, components|
      components['versions'].each do |version|
        context "On #{platform} #{version}" do
          context 'When all attributes are default' do
            before do
              Fauxhai.mock(platform: platform, version: version)
            end
            let(:chef_run) do
              ChefSpec::SoloRunner.new(platform: platform, version: version) do |node|
                # Node attributes
              end.converge(described_recipe)
            end

            it 'converges successfully' do
              expect { chef_run }.to_not raise_error
            end
          end
        end
      end
    end
  end
end
