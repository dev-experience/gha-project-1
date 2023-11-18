output "id" {
  value       = azurerm_linux_function_app.this.id
  description = "Azure Functions app ID"
}

output "application_url" {
  value       = "https://${azurerm_linux_function_app.this.name}.azurewebsites.net"
  description = "Azure Functions application URL"
}
