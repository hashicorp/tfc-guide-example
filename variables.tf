variable "region"{
	default = "ap-south-1b"
}
variabl "vpc_cidr"{
	default = "190.160.0.0/16" 
}
variabl "subnet_cidr"{
	type = "list"
	default = ["190.160.1.0/24","190.160.2.0/24","190.160..0/24"] 
}
#variabl "azs"{
#	type= "list"
#	default = ["ap-south-1a","ap-south-1b","ap-south-1c"] 
#}

# Declare the data source
data "aws_availability_zones" "azs"{
	
}

variable "db_read_capacity" {
  type    = number
  default = 1
}

variable "db_write_capacity" {
  type    = number
  default = 1
}

variable "tag_user_name" {
  type = string
}
