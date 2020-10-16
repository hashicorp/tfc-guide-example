variable "subnet_count" {
  default = 0
}

variable "subnet_names" {
  type = list
}

variable "subnet_cidr_blocks" {
  type = list
}

variable "service_endpoints" {
  type = list
}

variable "rg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}
