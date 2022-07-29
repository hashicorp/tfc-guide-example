provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.allow_office.id
  ]

  tags = {
    Name = var.instance_name
  }

    depends_on = [
      aws_security_group.allow_office
    ]
}

resource "aws_security_group" "allow_office" {
  name        = "allow_office"
  description = "Allow ssh from office WAN IP"
  vpc_id      = var.vpc 

  ingress {
    description       = "SSH from Office"
    from_port         = 22 
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = [
      "72.220.200.33/32"
    ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}