# Create a resource group
resource "azurerm_resource_group" "dev-ddp-rg" {
  name     = var.rg_name
  location = var.rg_region
}