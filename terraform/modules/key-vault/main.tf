data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "this" {
  name                = "kv-${local.location_slug}-${var.base_name}-${local.environment_slug}"
  resource_group_name = var.resource_group_name
  location            = var.location

  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "Standard"
  soft_delete_retention_days = 90

  enable_rbac_authorization = true
  # Set `purge_protection_enabled` to `true` for real-world usage
  purge_protection_enabled  = true

  tags = var.tags
}

