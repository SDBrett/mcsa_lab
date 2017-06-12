# # encoding: utf-8

# Inspec test for recipe mcsa_lab::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

if os.windows?
  # This is an example test, replace with your own test.
  describe user('Administrator'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
