provider "aws" {
  region = "ap-south-1b"
}
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy ="default"
  
  tags = {
    Name = "Main"
    Location = "Mumbai"
  }
}

resource "aws_subnet" \n "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "var.subnet_cidr

  tags = {
    Name = "subnet1"
  }
}
