module "resource_group" {
  source    = "../../modules/azure/resource_group"
  rg_name   = var.rg_name
  rg_region = var.rg_region
}

module "vnet" {
  source           = "../../modules/azure/vnet"
  vnet_name        = var.vnet_name
  vnet_cidr_blocks = var.vnet_cidr_blocks
  rg_name          = module.resource_group.rg_name
  rg_location      = module.resource_group.rg_location
}

module "subnet" {
  source             = "../../modules/azure/subnet"
  subnet_count       = var.subnet_count
  subnet_names       = var.subnet_names
  subnet_cidr_blocks = var.subnet_cidr_blocks
  service_endpoints  = var.service_endpoints
  rg_name            = module.resource_group.rg_name
  vnet_name          = module.vnet.vnet_name
}

module "network_security_group" {
  source      = "../../modules/azure/network_security_group"
  rg_name     = module.resource_group.rg_name
  rg_location = module.resource_group.rg_location
  subnet_ids  = module.subnet.subnet_ids
}

module "managed_identity" {
  source                           = "../../modules/azure/managed_identity"
  rg_name                          = module.resource_group.rg_name
  rg_location                      = module.resource_group.rg_location
  databricks_managed_identity_name = var.databricks_managed_identity_name
}

module "storage_account" {
  source                     = "../../modules/azure/storage_account"
  rg_name                    = module.resource_group.rg_name
  rg_location                = module.resource_group.rg_location
  adls_storage_account_name  = var.adls_storage_account_name
  dbr_storage_account_name   = var.dbr_storage_account_name
  dbr_storage_container_name = var.dbr_storage_container_name
  account_tier               = var.adls_account_tier
  account_replication_type   = var.adls_account_replication_type
  account_kind               = var.adls_account_kind
  is_hns_enabled             = var.adls_is_hns_enabled
}

module "databricks_workspace" {
  source         = "../../modules/azure/databricks"
  rg_name        = module.resource_group.rg_name
  rg_location    = module.resource_group.rg_location
  subnet_names   = module.subnet.subnet_names
  vnet_id        = module.vnet.vnet_id
  dbr_depends_on = [module.network_security_group.nsg-association]
}


