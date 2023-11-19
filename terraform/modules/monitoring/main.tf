resource "azurerm_log_analytics_workspace" "this" {
  name                = "log-${var.location_slug}-${var.base_name}-${var.environment_slug}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = var.tags
}

resource "azurerm_application_insights" "this" {
  name                = "appi-${var.location_slug}-${var.base_name}-${var.environment_slug}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.this.id

  tags = var.tags

  depends_on = [ azurerm_log_analytics_workspace.this ]
}
