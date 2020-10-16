resource "azurerm_subnet" "dev-ddp-sub-dbr-1" {
  count                = var.subnet_count
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_cidr_blocks[count.index]]

  service_endpoints = var.service_endpoints
}
