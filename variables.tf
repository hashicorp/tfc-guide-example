variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "D-Is-Everything"
}

variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "db_table_name" {
  type    = string
  default = "terraform-learn"
}

variable "db_read_capacity" {
  type    = number
  default = 1
}

variable "db_write_capacity" {
  type    = number
  default = 1
}
