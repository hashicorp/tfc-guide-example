output "subnet_names" {
  value = azurerm_subnet.dev-ddp-sub-dbr.*.name
}
