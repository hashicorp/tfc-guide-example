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

