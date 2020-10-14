
variable "rg_name" {
  type    = string
  default = "dev-ddp-rg"
}

variable "vnet_name" {
  type    = string
  default = "dev-ddp-vnet"
}

variable "vnet_cidr_blocks" {
  type    = list
  default = ["10.0.0.0/16"]
}

variable "subnet_names" {
  type    = list
  default = ["dev-ddp-sub-dbr-1", "dev-ddp-sub-dbr-2"]
}

variable "subnet_cidr_blocks" {
  type    = list
  default = ["10.0.1.0/24", "10.0.7.0/24"]
}
variable "service_endpoints" {
  type    = list
  default = ["Microsoft.Sql", "Microsoft.Storage"]
}
