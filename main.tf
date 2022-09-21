provider "aws" {
  region = var.region
}
data "aws_ami" "windows" {
     most_recent = true

     filter {
        name   = "name"
        values = ["Windows_Server-2019-English-Full-Base-*"]

 }

     filter {
       name   = "virtualization-type"
       values = ["hvm"]

 }

     owners = ["801119661308"] # Canonical

 }

 module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC"
  vpc_id      = "vpc-0c2a9b973989149fb"

  ingress_with_cidr_blocks = [
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      description = "User-service ports (ipv4)"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      description = "User-service ports (ipv4)"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "single-instance"

  ami                    = data.aws_ami.windows.id
  instance_type          = var.instance_type
  key_name               = "ec2"
  vpc_security_group_ids = [module.security-group.sg-id]
  subnet_id              = "subnet-06ea338d3feeb4a14"

  user_data = <<-EOT
    <powershell>
    # Rename Machine
    Rename-Computer -NewName "single-instance" -Force;
  
    # Restart machine
    shutdown -r -t 10;
    </powershell>
  EOT

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "single-instance"
  }
}
