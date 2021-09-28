variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

variable "vpc-name" {
  description = "VPC Name"
  default = "vpc-standard"
}

variable "environment" {
  description = "Environment Variable"
  default = "dev"
}

variable "team" {
  description = "Mandatory tag to determine owning team"
  default = "Not Modified"
}

variable "vpc-cidr" {
  description = "VPC network cidr for all subnets"
  default = "192.168.1.0/24"
}