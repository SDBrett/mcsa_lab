data "aws_ami" "server2016_ami" {
    most_recent             = true
    owners                  = ["801119661308"]
    filter {
        name                = "name"
        values              = ["Windows_Server-2016-English-Full-Base-2017.07.13"]
    }
    filter {
        name                = "virtualization-type"
        values              = ["hvm"]
    }
    filter {
        name                = "platform"
        values              = ["windows"]
    }
}
