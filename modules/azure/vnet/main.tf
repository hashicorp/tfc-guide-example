# Create a virtual network within the resource group
resource "azurerm_virtual_network" "dev-ddp-vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  address_space       = var.vnet_cidr_blocks
}
