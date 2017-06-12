# # encoding: utf-8

# Inspec test for recipe mcsa_lab::dc_DSCConfiguration

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\Modules\\PSDesiredStateConfiguration\\DSCResources\\xComputerManagement') do
  it { should be_directory }
end
