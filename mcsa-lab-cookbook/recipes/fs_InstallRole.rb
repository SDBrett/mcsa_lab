#
# Cookbook:: mcsa_lab
# Recipe:: fs_InstallRole
#
# Copyright:: 2017, Brett Johnson

dsc_resource 'FileServer' do
  resource :WindowsFeature
  property :Ensure, 'Present'
  property :Name, 'File-Services'
end

batch 'Configure_Disks' do
  code <<-EOH
  diskpart /s c:/temp/driveconfig.bat
  EOH
  action :nothing
end

cookbook_file 'C:/temp/driveconfig.bat' do
  source 'driveconfig.bat'
  action :create
  notifies :run, 'batch[Configure_Disks]', :immediately
  only_if { ::Dir.exist?("C:/temp/")}
end

directory 'C:/SampleScripts' do
  action :create
  notifies :create, 'cookbook_file[C:/SampleScripts/file_server_configure.ps1]'
end

cookbook_file 'C:/SampleScripts/file_server_configure.ps1' do
  source 'file_server_configure.ps1'
  action :nothing
end
