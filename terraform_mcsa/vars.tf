variable "awskeypair" {
    type                    = "map"
    description             = "SSH keypair to use to connect to instances"
    default = {
      key_pair_name           = "Enter name of AWS Key pair" # Specify name of an AWS keypair to use
    }
}

variable "chef_provision" {
  type                      = "map"
  description               = "Configuration details for chef server"
  default = {
    server_url              = "Enter Chef Server URL"
    user_name               = "Enter user name for chef server"
    user_key_path           = "Enter path for Chef server key file"
    recreate_client         = true
  }
}

#Using plain text for a password is a REALLY bad practice, this is intended
#for a test environment only. Investigate options such as vault for better
#security practices. 
variable "administrator_pw" {
  type                     = "string"
  description              = "Password for the local administrator account"
  default                  = "P@ssword1234"
}

variable "user_region" {
    type                    = "string"
    description             = "AWS region to use by default"
    default                 = "ap-southeast-2"
}



data "template_file" "domain_controller" {
  template                  = "${file("userdata.txt")}"
  count                     = "${var.domain_controller["number"]}"

  vars {
    hostname_increment      = "${count.index}"
    admin_password          = "${var.administrator_pw}"
    hostname                = "${var.domain_controller.["hostname_prefix"]}-"
    hostname_increment      = "${count.index}"
  }
}

/*

TO BE TESTED

data "template_file" "replica_domain_controller" {
  template                  = "${file("userdata.txt")}"

  vars {

    admin_password          = "${var.administrator_pw}"
    hostname                = "${var.replica_domain_controller.["hostname_prefix"]}-${count.index}"
  }
}
*/

data "template_file" "file_server" {
  template                  = "${file("userdata.txt")}"
  count                     = "${var.file_server["number"]}"

  vars {
    admin_password          = "${var.administrator_pw}"
    hostname                = "${var.file_server.["hostname_prefix"]}-"
    hostname_increment      = "${count.index}"
  }
}