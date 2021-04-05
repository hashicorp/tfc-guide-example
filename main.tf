provider "azurerm" {
version = "~>2.49.0"
skip_provider_registration= "true"
features {}
}

locals{
environmentname=terraform.workspace
}

output "workspacename_is" {
  value = local.environmentname
}
