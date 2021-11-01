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

  tags = {
    Name = "node1"
  }
}

resource "aws_instance" "ubuntu2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "node2"
  }
}

resource "aws_instance" "ubuntu3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

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

  azs             = ["us-east-2c"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
