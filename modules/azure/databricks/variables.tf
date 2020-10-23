variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "subnet_names" {
  type = list
}


variable "vnet_id" {
  type = string
}

# need to add the NSG association with subnet as an indirect dependency
variable "dbr_depends_on" {
  type = any
}