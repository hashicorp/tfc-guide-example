# Create a resource group
resource "azurerm_resource_group" "dev-ddp-rg" {
  name     = var.rg_name
  location = var.rg_region
}

resource "azurerm_network_watcher" "example" {
  name                = "dbr-nwwatcher"
  location            = azurerm_resource_group.dev-ddp-rg.location
  resource_group_name = azurerm_resource_group.dev-ddp-rg.name
}