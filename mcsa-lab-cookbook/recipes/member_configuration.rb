#
# Cookbook:: mcsa_lab
# Recipe:: mcsa_DomainJoin
#
# Copyright:: 2017, The Authors, All Rights Reserved.

ipaddr = search(:node, 'name:pdc-0')
dnsserver = ipaddr[0]['ipaddress']

powershell_script 'set_dns' do
  code <<-EOH
  Set-DNSClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses ('#{dnsserver}')
  EOH
end

# May no longer be needed with the 10 min delay before joining the domain. Further testing required

template 'C:/windows/system32/drivers/etc/hosts' do
  variables(
  dcip: dnsserver
  )
  source 'hosts.erb'
end

reboot 'Restart Computer' do
  action :nothing
end


#Could change to use test of resolve-dnsname, should remove the need
#for a specific delay timer.

powershell_script 'joindomain' do
  code <<-EOH

  if (!((gwmi win32_computersystem).partofdomain -eq $true)) {
    $domain = "test.lab"
    $password = "ChefDemo,1" | ConvertTo-SecureString -asPlainText -Force
    $username = "Administrator@test.lab"
    $credential = New-Object System.Management.Automation.PSCredential($username,$password)

    Write-Host -ForegroundColor yellow "10 minute wait for DNS to resolve domain"
    Start-Sleep -s 600

    Add-Computer -DomainName $domain -Credential $credential -ErrorAction SilentlyContinue
    }
    EOH
  returns 1
  notifies :reboot_now, 'reboot[Restart Computer]', :immediately
end