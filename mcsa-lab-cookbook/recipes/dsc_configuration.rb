#
# Cookbook:: mcsa_lab
# Recipe:: dsc_configuration
#
#  Copyright:: 2017, Brett Johnson, All Rights Reserved.


# Configure default local configuration manager settings to enable DSC to run
# after the server has restarted

powershell_script 'apply_lcm' do
  code <<-EOH
  configuration LCM
  {
    LocalConfigurationManager
    {

      ConfigurationMode = 'ApplyOnly'
      RebootNodeIfNeeded = $true
    }
  }
  LCM -OutputPath #{Chef::Config['file_cache_path']}
  Set-DscLocalConfigurationManager -Path #{Chef::Config['file_cache_path']}
  EOH
end