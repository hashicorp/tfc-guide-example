provider "aws": {
  access_key = "AKIATCINKSEDYRG5CCOB"
  secret_key = "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"
  region     = "ap-south-1b"
}
resource "aws_vpc" "main" {
  cidr_block = "$var.vpc_cidr"
  instance_tenancy ="default"
  
  tags = {
    Name = "main"
    Location = "Mumbai"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "$aws_vpc.main.id"
  cidr_block = "$var.subnet_cidr"

  tags = {
    Name = "subnet1"
  }
}
