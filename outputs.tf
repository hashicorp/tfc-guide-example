output "instance_ami" {
  value = aws_instance.ubuntu.ami
}

output "instance_arn" {
  value = aws_instance.ubuntu.arn
}

output "dazz_role_arn" {
  value = module.dazz_role.role_arn
}

