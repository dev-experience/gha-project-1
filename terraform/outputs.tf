data "azurerm_resource_group" "current" {
  name     = var.resource_group_name
}

locals {
  resource_group_id = data.azurerm_resource_group.current.id
  tenant_id         = data.azurerm_client_config.current.tenant_id
}

output "resource_group_portal_url" {
  value = "https://portal.azure.com/#@${tenant_id}/resource${resource_group_id}/"
}

output "app_url" {
  value = module.function_app.application_url
}
