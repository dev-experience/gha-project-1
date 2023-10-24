terraform {
  required_providers {
    arm2tf = {
      source = "cloud-maker-ai/arm2tf"
    }
  }
}

data "azurerm_client_config" "current" {
}

resource "arm2tf_unique_string" "key_vault_base_name" {
  input = [ var.base_name ]
}

resource "azurerm_key_vault" "this" {
  name                = "kv-${local.location_slug}-${arm2tf_unique_string.key_vault_base_name.id}-${local.environment_slug}"
  resource_group_name = var.resource_group_name
  location            = var.location

  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"
  soft_delete_retention_days = 90

  enable_rbac_authorization = true
  purge_protection_enabled = true

  tags = var.tags
}

