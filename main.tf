terraform{
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  access_key="AKIA3F55JVDX76BDCJXS"
  secret_key="mOojTaBCHmX64XA1WbkufI6ptCvLTsldRXGKUfD1"
  region  = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c1ec05212231c930"
  instance_type = "t2.micro"
}
