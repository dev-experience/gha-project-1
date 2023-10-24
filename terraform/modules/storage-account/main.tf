terraform {
  required_providers {
    arm2tf = {
      source = "cloud-maker-ai/arm2tf"
    }
  }
}

resource "arm2tf_unique_string" "storage_account_base_name" {
  input = [ "${local.environment_slug}${var.base_name}" ]
}

resource "azurerm_storage_account" "this" {
  name                     = "st${arm2tf_unique_string.storage_account_base_name.id}${local.environment_slug}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
