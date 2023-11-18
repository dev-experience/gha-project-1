resource "azurerm_storage_account" "this" {
  name                     = "st${var.base_name}${local.environment_slug}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
