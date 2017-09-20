/*  The file is to define the number of servers
    that you wish to deploy in the lab. Update the default value for each server
    type.
    Use 0 if you do not want any servers of that type deployed
    You will get domain join errors if there are no DC's in the environment

    Do not adjust the number value for domain_controller, this is to keep consistency with the other variables. The as the PDC is used to create the domain, it is intended that there is only one.

    Using a T2.micro has shown issues with the AD services loading fast enough
    Experienced issues with domain resolution after the deployment
    Do not recommend using an instance smaller then Medium, despite lower cost

    There is an issue with server naming. This is appears to be a bug with the template provider in terraform not updating for each deployment

*/

variable "domain_controller" {
    description         = "For creation of primary domain controller"
    default = {
      type              = "t2.medium"
      number             = 1 #Do not adjust, this is to keep consistency with other servers
      hostname_prefix   = "pdc"
  }
}

variable "replica_domain_controller" {
    description         = "Creation of replica domain controllers"
    default = {
      type              = "t2.micro"
      number             = 0
      hostname_prefix   = "dc"
  }
}

variable "file_server" {
    description         = "The number of file servers to be deployed"
    default = {
      type              =  "t2.medium"
      number             = 2
      hostname_prefix   = "fs"
  }
}
