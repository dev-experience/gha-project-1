output "application_name" {
  value = local.azure_functions_app_name
  description = "Azure Functions application name"
}

output "id" {
  value       = azurerm_linux_function_app.this.id
  description = "Azure Functions app ID"
}

output "application_url" {
  value       = "https://${azurerm_linux_function_app.this.name}.azurewebsites.net"
  description = "Azure Functions application URL"
}

output "application_webhook_url" {
  value = local.azure_functions_app_webhook_url
  sensitive = true
  description = "Azure Functions application webhook URL"
}
