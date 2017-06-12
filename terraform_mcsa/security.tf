# Create a security group to allow  and web traffic
resource "aws_security_group" "windows_lab" {
    vpc_id                  = "${aws_vpc.windows_lab_vpc.id}"
    name                    = "windows_lab_sg"
    description             = "Security group for mcsa lab"
    ingress {
        from_port           = "0"
        to_port             = "0"
        protocol            = "-1"
        cidr_blocks         = ["${aws_vpc.windows_lab_vpc.cidr_block}"]
    }
    ingress {
        from_port           = "5985"
        to_port             = "5985"
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    ingress {
        from_port           = "5986"
        to_port             = "5986"
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    ingress {
        from_port           = "3389"
        to_port             = "3389"
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }

    egress {
        from_port           = "0"
        to_port             = "0"
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }
    tags {
        tool                = "terraform"
        area                = "security"
    }
}
