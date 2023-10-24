output "id" {
  value       = azurerm_storage_account.this.id
  description = "Storage Account ID"
}

output "name" {
  value       = azurerm_storage_account.this.name
  description = "Storage Account name"
}

output "access_key" {
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
  description = "Storage Account access key"
}
