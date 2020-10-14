provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "dev-ddp-rg" {
  name     = var.rg_name
  location = "East US 2"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "dev-ddp-vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.dev-ddp-rg.name
  location            = azurerm_resource_group.dev-ddp-rg.location
  address_space       = var.vnet_cidr_blocks
}

resource "azurerm_subnet" "dev-ddp-sub-dbr-1" {
  count                = 2
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.dev-ddp-rg.name
  virtual_network_name = azurerm_virtual_network.dev-ddp-vnet.name
  address_prefixes     = [var.subnet_cidr_blocks[count.index]]

  service_endpoints = var.service_endpoints
}
