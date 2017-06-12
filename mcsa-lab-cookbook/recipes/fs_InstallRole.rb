#
# Cookbook:: mcsa_lab
# Recipe:: fs_InstallRole
#
# Copyright:: 2017, Brett Johnson, All Rights Reserved.

remote_directory 'C:/Windows/System32/WindowsPowerShell/v1.0/Modules/PSDesiredStateConfiguration' do
  source 'MemberServers'
end

dsc_resource 'FileServer' do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'File-Services'
end
