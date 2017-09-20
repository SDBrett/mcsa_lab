resource "aws_instance" "file_server" {

    instance_type   = "${var.file_server["type"]}"
    count           = "${var.file_server["number"]}"
    ami             = "${data.aws_ami.server2016_ami.id}"
    key_name        = "${var.awskeypair.["key_pair_name"]}"
    vpc_security_group_ids = ["${aws_security_group.windows_lab.id}"]
    subnet_id       = "${aws_subnet.windows_lab_public.id}"
    user_data       = "${element(data.template_file.file_server.*.rendered, count.index)}"
    depends_on      = ["aws_instance.domain_controller"]

  provisioner "chef" {
    server_url      = "${var.chef_provision.["server_url"]}"
    user_name       = "${var.chef_provision.["user_name"]}"
    user_key        = "${file("${var.chef_provision.["user_key_path"]}")}"
    node_name       = "${var.file_server.["hostname_prefix"]}-${count.index}"
    run_list        = ["role[fileserver]"]
    recreate_client = "${var.chef_provision.["recreate_client"]}"
    on_failure      = "continue"

    attributes_json = <<-EOF
    {
      "tags": [
        "fileserver"
      ]
    }
    EOF
  }

  ebs_block_device {
    device_name   = "xvdce"
    volume_size   = 5

  }
  connection {
    type        = "winrm"
    user        = "Administrator"
    password    = "${var.administrator_pw}"
  }

  tags {
    Name = "${var.file_server.["hostname_prefix"]}-${count.index}"
    role = "file_server"
  }

}
