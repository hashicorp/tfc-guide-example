output "subnet_names" {
  value = azurerm_subnet.dev-ddp-sub-dbr.*.name
}

output "subnet_ids" {
  value = azurerm_subnet.dev-ddp-sub-dbr.*.id
}