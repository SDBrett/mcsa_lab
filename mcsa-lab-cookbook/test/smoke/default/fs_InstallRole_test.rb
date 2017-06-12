# # encoding: utf-8

# Inspec test for recipe mcsa_lab::fs_InstallRole

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe windows_feature('File-Services') do
  it{ should be_installed}
end
