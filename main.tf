provider "aws" {
    region = "us-west-2"
}

resource "aws_security_group" "default" {
  name_prefix = "test_instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Created-by = "Terraform"
    Identity   = "test_instance"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-c62eaabe"
  instance_type = var.instance_type
  
  associate_public_ip_address = false

  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Identity = "test_instance"
  }

}
