variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "vpc" {
  description = "AWS vpc id"
  default     = "vpc-0e622ef36e406941d"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "tf-ubuntu"
}

