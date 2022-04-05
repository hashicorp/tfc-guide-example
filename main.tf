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

  tags = {
    Name = var.instance_name
  }
}

module "public-bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  bucket_prefix = "my-public-bucket"
  acl           = "public-read"
}

module "dazz_role" {
  source = "./aws-dazz-role"
  name   = "SecurityTooling_Dazz"
  source_arns = [
    "arn:aws:iam::301712069658:role/assumer-readonly",
    "arn:aws:sts::301712069658:assumed-role/assumer-readonly/Dazz"
  ]
  policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  external_id = "dazzlab-lyhmadt275wt"
  tags = {
    vendor = "dazz"
  }
}

