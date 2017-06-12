#
# Cookbook:: mcsa_lab
# Recipe:: dc_DomainBuild
#
# Copyright:: 2017, Brett Johnson, All Rights Reserved.

dsc_resource 'InstallAD' do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'AD-Domain-Services'
end

dsc_resource 'InstallRSAT' do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'RSAT-ADDS'
end

## TODO DomainName property is giving error when using vairable from default.rb
##      Error is null value, so for work around, this has been hardset

dsc_resource 'BuildDomain' do
  resource :xADDomain
  property :DomainName, 'Test.lab'
  property :DomainAdministratorCredential, ps_credential("#{node['user']['password']}")
  property :SafemodeAdministratorPassword, ps_credential("#{node['user']['password']}")
  property :DependsOn, ['WindowsFeature]InstallAD']
end

reboot 'DCBuid' do
  delay_mins 1
  action :request_reboot
  reason 'post AD install'
end