resource "aws_instance" "domain_controller" {
#${var.amis["us-east-1"]}
  instance_type   = "${var.domain_controller["type"]}"
  count           = 1
  ami             = "${data.aws_ami.server2016_ami.id}"
  key_name        = "${var.awskeypair.["key_pair_name"]}"
  vpc_security_group_ids = ["${aws_security_group.windows_lab.id}"]
  subnet_id       = "${aws_subnet.windows_lab_public.id}"

  provisioner "chef" {
  server_url      = "${var.chef_provision.["server_url"]}"
  user_name       = "${var.chef_provision.["user_name"]}"
  user_key        = "${file("${var.chef_provision.["user_key_path"]}")}"
  node_name       = "${var.domain_controller.["hostname_prefix"]}-${count.index}"
  run_list        = ["role[domaincontroller]"]
  recreate_client = "${var.chef_provision.["recreate_client"]}"
  on_failure      = "continue"

  attributes_json = <<-EOF
  {
    "tags": [
      "domaincontroller"
    ]
  }
  EOF
  }

  connection {
    type        = "winrm"
    user        = "Administrator"
    password    = "${var.administrator_pw}"
  }

  tags {
    name = "${var.domain_controller.["hostname_prefix"]}-${count.index}"
    role = "domain_controller"
  }

  user_data = "${data.template_file.domain_controller.rendered}"
}

# Show the public IP address at the end
output "address1" {
  value = "${aws_instance.domain_controller.private_ip}"
}
