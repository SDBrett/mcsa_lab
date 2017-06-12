#
# Cookbook:: mcsa_lab
# Recipe:: dc_DSCConfiguration
#
# Copyright:: 2017, Brett Johnson, All Rights Reserved.


powershell_script 'configure_dc_lcm' do
  code <<-EOH
  Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
  Install-Module xactivedirectory -confirm:$false -Force
  Install-Module xcomputermanagement -confirm:$false -Force
  EOH
end
