data "azurerm_client_config" "current" {
}

data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

locals {
  tenant_id         = data.azurerm_client_config.current.tenant_id
  subscription_id   = data.azurerm_subscription.current.subscription_id
  resource_group_id = data.azurerm_resource_group.current.id
}

output "subscription_id" {
  value = local.subscription_id
}

output "resource_group_portal_url" {
  value = "https://portal.azure.com/#@${local.tenant_id}/resource${local.resource_group_id}/"
}

output "app_name" {
  value = module.function_app.application_name
}

output "app_url" {
  value = module.function_app.application_url
}

# output "app_webhook_url" {
#   value = module.function_app.application_webhook_url
#   sensitive = true
# }
