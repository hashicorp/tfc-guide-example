data "azurerm_subscription" "dev" {
  # filter {
  #   display_name = "Azure subscription 1"
  # }

}

data "azurerm_client_config" "current" {}

resource "azurerm_user_assigned_identity" "databricks-uai" {
  resource_group_name = var.rg_name
  location            = var.rg_location
  name                = var.databricks_managed_identity_name
}

resource "azurerm_role_definition" "databricks-uai-role-definition" {
  name        = "databricks-uai-adls-role"
  scope       = data.azurerm_subscription.dev.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions     = ["Microsoft.Storage/storageAccounts/queueServices/queues/delete", "Microsoft.Storage/storageAccounts/queueServices/queues/read", "Microsoft.Storage/storageAccounts/queueServices/queues/write"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.dev.id,
  ]
}

resource "azurerm_role_assignment" "databricks-role-assignment" {
  name               = "00000000-0000-0000-0000-000000000000"
  scope              = data.azurerm_subscription.dev.id
  role_definition_id = azurerm_role_definition.databricks-uai-role-definition.role_definition_id
  principal_id       = azurerm_user_assigned_identity.databricks-uai.principal_id
}
