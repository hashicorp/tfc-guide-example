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

resource "aws_instance" "ubuntu1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_id = aws_security_group.Diplom.id

  tags = {
    Name = "node1"
  }
}

resource "aws_instance" "ubuntu2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_id = aws_security_group.Diplom.id

  tags = {
    Name = "node2"
  }
}

resource "aws_instance" "ubuntu3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_id = aws_security_group.Diplom.id

  tags = {
    Name = "node3"
  }
}

data "aws_region" "current" {}

data "aws_instance" "ubuntu1" {
  instance_id = aws_instance.ubuntu1.id
}

data "aws_instance" "ubuntu2" {
  instance_id = aws_instance.ubuntu2.id
}

data "aws_instance" "ubuntu3" {
  instance_id = aws_instance.ubuntu3.id
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "diplom-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a","us-east-2b", "us-east-2c" ]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
  public_subnets  = ["10.0.101.0/24","10.0.102.0/24", "10.0.103.0/24" ]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "Diplom" {
  name        = "Diplom"
  description = "Allow TLS,SSH,HTTP inbound traffic"
  vpc_id      = aws_vpc.diplom-vpc.id

  ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.diplpm-vpc.cidr_block]
      ipv6_cidr_blocks = [aws_vpc.diplom-vpc.ipv6_cidr_block]
    } 
    ,
   
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.diplpm-vpc.cidr_block]
      ipv6_cidr_blocks = [aws_vpc.diplom-vpc.ipv6_cidr_block]
    }
    ,

    {
      description      = "HTTP from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.diplpm-vpc.cidr_block]
      ipv6_cidr_blocks = [aws_vpc.diplom-vpc.ipv6_cidr_block]
    }

  ] 

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  tags = {
    Name = "allov_ssh_http_tsl"
  }
}
