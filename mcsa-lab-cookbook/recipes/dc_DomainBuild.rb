#
# Cookbook:: mcsa_lab
# Recipe:: dc_DomainBuild
#
# Copyright:: 2017, Brett Johnson

dsc_resource "InstallAD" do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'AD-Domain-Services'
end

dsc_resource "InstallRSAT" do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'RSAT-ADDS'
end

reboot 'Restart Computer' do
  action :nothing
end

dsc_resource "BuildDomain" do
  resource :xADDomain
  property :DomainName, "#{node['ad']['domain_name']}"
  property :DomainAdministratorCredential, ps_credential("#{node['user']['password']}")
  property :SafemodeAdministratorPassword, ps_credential("#{node['user']['password']}")
  property :DependsOn, ['WindowsFeature]InstallAD']
  notifies :request_reboot, 'reboot[Restart Computer]', :immediately
end
