output "instance_ami" {
  value = aws_instance.ubuntu1.ami
}

output "instance_arn" {
  value = aws_instance.ubuntu1.arn
}

output "aws_region" {
  value = data.aws_region.current.name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_ip1" {
  value = data.aws_instance.ubuntu1.private_ip
}

output "private_ip2" {
  value = data.aws_instance.ubuntu2.private_ip
}

output "private_ip3" {
  value = data.aws_instance.ubuntu3.private_ip
}

output "subnet_id" {
  value = data.aws_instance.ubuntu1.subnet_id
}

