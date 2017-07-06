default['ad']['domain_name'] = 'Test.lab'
default['ad']['root_ou'] = 'DC=Test, DC=lab'

default['user']['password'] = 'ChefDemo,1'


default['memberserver']['domain_join_task_name'] = 'JoinDomain'
#default ['chef-client']['interval'] = 180

default['chef_client']['interval']    = '180'
default['chef_client']['splay']       = '30'
