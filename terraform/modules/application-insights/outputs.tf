output "id" {
  value       = azurerm_application_insights.this.id
  description = "Application Insights ID"
}

output "connection_string" {
  value       = azurerm_application_insights.this.connection_string
  description = "Application Insights connection string"
}
