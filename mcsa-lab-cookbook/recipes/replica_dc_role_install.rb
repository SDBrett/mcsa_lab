#
# Cookbook:: mcsa_lab
# Recipe:: replica_dc_role_install
#
# Copyright:: 2017, The Authors, All Rights Reserved.

dsc_resource "InstallAD" do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'AD-Domain-Services'
  property :DependsOn, ['Waitfordomain]InstallAd']
end

dsc_resource "InstallRSAT" do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'RSAT-ADDS'
end

reboot 'Restart Computer' do
  action :nothing
end

dsc_resource "Waitfordomain" do
  resource :xWaitForADDomain
  property :DomainName, node['ad']['domain_name']
  property :RetryCount, 20
  property :RetryIntervalSec, 60
  property :DependsOn, ['WindowsFeature]InstallRSAT']
end

dsc_resource "ReplicaDC" do
  resource :xADDomain
  property :DomainName, node['ad']['domain_name']
  property :DomainAdministratorCredential, ps_credential(node['user']['password'])
  property :SafemodeAdministratorPassword, ps_credential(node['user']['password'])
  property :DependsOn, ['WindowsFeature]InstallAD']
  notifies :request_reboot, 'reboot[Restart Computer]', :immediately

end
