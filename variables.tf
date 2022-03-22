variable "region" {
  description = "AWS region"
  default     = "ap-northeast-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "example-01"
}

variable "owned_by" {
  description = "Owned_by"
  default     = "kahoru.hagiya@hashicorp.com"
}

