/*  The file is to define the number of servers
    that you wish to deploy in the lab. Update the default value for each server
    type.
    Use 0 if you do not want any servers of that type deployed
    You will get domain join errors if there are no DC's in the environment

    Using a T2.micro has shown issues with the AD services loading fast enough
    Experienced issues with domain resolution after the deployment
    Do not recommend using an instance smaller then Medium, despite lower cost

*/

variable "domain_controller" {
    description         = "For creation of primary domain controller"
    default = {
      type              = "t2.medium"
      hostname_prefix   = "pdc"
  }
}

# Currently not implemented with CHef cookbooks. Do not change count from 
# Zero
#variable "replica_domain_controller" {
#   description         = "Creation of replica domain controllers"
#    default = {
#      type              = "t2.micro"
#      count             = 0
#      hostname_prefix   = "dc"
#  }
#}

variable "file_server" {
    description         = "The number of file servers to be deployed"
    default = {
      type              =  "t2.medium"
      count             = 2
      hostname_prefix   = "fs"
  }
}
