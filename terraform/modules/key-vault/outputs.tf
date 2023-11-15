output "id" {
  value       = azurerm_key_vault.this.id
  description = "Key Vault ID"
}

output "uri" {
  value       = azurerm_key_vault.this.vault_uri
  description = "Key Vault URI"
}
