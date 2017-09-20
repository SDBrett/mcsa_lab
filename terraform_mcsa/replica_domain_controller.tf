/*

TO BE TESTED

# Set an admin password for the configuration



# Create a new EC2 instance with Chef as provisioner
resource "aws_instance" "replica_domain_controller" {
#${var.amis["us-east-1"]}
  instance_type   = "${var.replica_domain_controller["type"]}"
  count           = "${var.replica_domain_controller.["number"]}"
  ami             = "${data.aws_ami.server2016_ami.id}"
  key_name        = "${var.awskeypair.["key_pair_name"]}"
  vpc_security_group_ids = ["${aws_security_group.windows_lab.id}"]
  subnet_id       = "${aws_subnet.windows_lab_public.id}"
  depends_on      = ["aws_instance.domain_controller"]

  provisioner "chef" {
  server_url      = "${var.chef_provision.["server_url"]}"
  user_name       = "${var.chef_provision.["user_name"]}"
  user_key        = "${file("${var.chef_provision.["user_key_path"]}")}"
  node_name       = "${var.replica_domain_controller.["hostname_prefix"]}-${count.index}"
  run_list        = ["role[replica_domaincontroller]"]
  recreate_client = "${var.chef_provision.["recreate_client"]}"
  }

  connection {
    type        = "winrm"
    user        = "Administrator"
    password    = "${var.administrator_pw}"
  }

  tags {
    name = "${var.replica_domain_controller.["hostname_prefix"]}-${count.index}"
    role = "replica_domain_controller"
  }

  user_data = "${data.template_file.replica_domain_controller.rendered}"
}

# Show the public IP address at the end
output "address" {
  value = "${aws_instance.replica_domain_controller.public_ip}"
}

*/