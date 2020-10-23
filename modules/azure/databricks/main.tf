resource "azurerm_databricks_workspace" "databricks-ws" {
  name                = "databricks-test"
  resource_group_name = var.rg_name
  location            = var.rg_location
  sku                 = "trial"

  custom_parameters {
    no_public_ip        = true
    public_subnet_name  = var.subnet_names[0]
    private_subnet_name = var.subnet_names[1]
    virtual_network_id  = var.vnet_id
  }

  tags = {
    Environment = "dev"
  }

  # need to add the NSG association with subnet as an indirect dependency
  depends_on = [var.dbr_depends_on]
}
