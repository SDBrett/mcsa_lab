name 'mcsa_lab'
maintainer 'Brett Johnson'
maintainer_email 'brett@sdbrett.com'
license 'Apache-2.0'
description 'Installs/Configures mcsa_lab'
long_description 'Installs/Configures mcsa_lab'
version '0.2.2'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/mcsa_lab/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/mcsa_lab'

depends 'ad-join', '~> 4.12'
