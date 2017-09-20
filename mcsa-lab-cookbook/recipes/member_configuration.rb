#
# Cookbook:: mcsa_lab
# Recipe:: mcsa_DomainJoin
#
# Copyright:: 2017, Brett Johnson

ipaddr = search(:node, 'name:pdc-0')
dnsserver = ipaddr[0]['ipaddress']

windows_task 'joindomain' do
  task_name node['memberserver']['domain_join_task_name']
  user 'Administrator'
  password node['user']['password']
  command 'powershell.exe -file c:/chefscripts/domainjoin.ps1'
  run_level :highest
  frequency :minute
  frequency_modifier 5
end

powershell_script 'set_dns' do
  code <<-EOH
  Set-DNSClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses ('#{dnsserver}')
  EOH
end

directory 'C:/chefscripts' do
  action :create
end

dsc_resource "Waitfordomain" do
  resource :xWaitForADDomain
  property :DomainName, node['ad']['domain_name']
  property :RetryCount, 20
  property :RetryIntervalSec, 60
end
#powershell_script 'configure_dc_lcm'

template 'C:/chefscripts/domainjoin.ps1' do
  variables(
  domainname:     node['ad']['domain_name'],
  taskname:       node['memberserver']['domain_join_task_name'],
  adminpassword:  node['user']['password']
  )
  source 'domainjoin.ps1.erb'
end
