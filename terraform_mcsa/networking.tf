resource "aws_vpc" "windows_lab_vpc" {
    cidr_block              = "10.1.0.0/16"
    enable_dns_hostnames    = "true"
    enable_dns_support      = "true"
    tags {
        tool                = "terraform"
        area                = "networking"
    }
}

# Create a public subnet in the new VPC
resource "aws_subnet" "windows_lab_public" {
    vpc_id                  = "${aws_vpc.windows_lab_vpc.id}"
    cidr_block              = "10.1.1.0/24"
    map_public_ip_on_launch = "true"
    tags {
        tool                = "terraform"
        area                = "networking"
    }
}

# Create a new Internet gateway
resource "aws_internet_gateway" "windows_lab_gw" {
    vpc_id                  = "${aws_vpc.windows_lab_vpc.id}"
    tags {
        tool                = "terraform"
        area                = "networking"
    }
}

# Create a route table for the new VPC
resource "aws_route_table" "windows_lab_routes" {
    vpc_id                  = "${aws_vpc.windows_lab_vpc.id}"
    route {
        cidr_block          = "0.0.0.0/0"
        gateway_id          = "${aws_internet_gateway.windows_lab_gw.id}"
    }
    tags {
        tool                = "terraform"
        area                = "networking"
    }
}

# Associate route table with subnet in VPC
resource "aws_route_table_association" "windows_lab_rta" {
    subnet_id               = "${aws_subnet.windows_lab_public.id}"
    route_table_id          = "${aws_route_table.windows_lab_routes.id}"
}
