resource "azurerm_storage_account" "ddp-adlsv2-storage" {
  name                     = var.adls_storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = var.account_tier             #"Standard"
  account_replication_type = var.account_replication_type #"LRS"
  account_kind             = var.account_kind             #"StorageV2"
  is_hns_enabled           = var.is_hns_enabled           #"true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "ddp-dbr-adls" {
  name               = "example"
  storage_account_id = azurerm_storage_account.ddp-adlsv2-storage.id

  properties = {
    hello = "aGVsbG8="
  }
}


resource "azurerm_storage_account" "ddp-dbr-temp-storage" {
  name                     = var.dbr_storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "ddp-dbr-temp-storage-container" {
  name                  = var.dbr_storage_container_name
  storage_account_name  = azurerm_storage_account.ddp-dbr-temp-storage.name
  container_access_type = "private"
}
