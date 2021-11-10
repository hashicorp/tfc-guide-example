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

  azs             = ["${var.region}a", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.3.0/24" ]
  public_subnets  = ["10.0.101.0/24", "10.0.103.0/24" ]

  enable_nat_gateway = false
  single_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }  
  vpc_tags = {
    Name = "vpc-name"
  }
}

resource "aws_security_group" "diplom" {
  name        = "Diplom"
  description = "Allow TLS,SSH,HTTP inbound traffic"
  vpc_id = module.vpc.vpc_id
  ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["10.0.101.0/24", "10.0.103.0/24" ]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    } 
    ,
   
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["10.0.101.0/24", "10.0.103.0/24" ]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
    ,

    {
      description      = "HTTP from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["10.0.101.0/24", "10.0.103.0/24" ]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }

  ] 

  egress = [
    {
      description      = "all to VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  tags = {
    Name = "allov_ssh_http_tsl"
  }
}

resource "aws_instance" "ubuntu1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.diplom.id]

  tags = {
    Name = "node1"
  }
}

resource "aws_instance" "ubuntu2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.diplom.id]
  

  tags = {
    Name = "node2"
  }
}

resource "aws_instance" "ubuntu3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.diplom.id]

  tags = {
    Name = "node3"
  }
}
