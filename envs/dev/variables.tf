variable "vnet_name" {
  type = string
}

variable "vnet_cidr_blocks" {
  type = list
}

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

variable "rg_region" {
  type = string
}

variable "databricks_managed_identity_name" {
  type = string
}

variable "adls_storage_account_name" {
  type = string
}

variable "dbr_storage_account_name" {
  type = string
}

variable "dbr_storage_container_name" {
  type = string
}

variable "adls_account_tier" {
  type = string
}

variable "adls_account_replication_type" {
  type = string
}

variable "adls_account_kind" {
  type = string
}

variable "adls_is_hns_enabled" {
  type = string
}


