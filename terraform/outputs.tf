data "azurerm_client_config" "current" {
}

data "azurerm_resource_group" "current" {
  name     = var.resource_group_name
}

locals {
  tenant_id         = data.azurerm_client_config.current.tenant_id
  resource_group_id = data.azurerm_resource_group.current.id
}

output "resource_group_portal_url" {
  value = "https://portal.azure.com/#@${local.tenant_id}/resource${local.resource_group_id}/"
}

output "app_url" {
  value = module.function_app.application_url
}
