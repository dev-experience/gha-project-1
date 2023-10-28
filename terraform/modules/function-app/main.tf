resource "azurerm_service_plan" "this" {
  name                = "asp-${local.location_slug}-${var.base_name}-${local.environment_slug}"
  resource_group_name         = var.resource_group_name
  location                    = var.location


  sku_name = "B1"
  os_type  = "Linux"

  tags = var.tags
}

# resource "azurerm_storage_account" "application" {
#   name                             = azurecaf_name.storage_account.result
#   resource_group_name              = var.resource_group
#   location                         = var.location
#   account_tier                     = "Standard"
#   account_replication_type         = "LRS"
#   enable_https_traffic_only        = true
#   allow_nested_items_to_be_public  = false

#   tags = {
#     "environment"      = var.environment
#     "application-name" = var.application_name
#   }
# }

resource "azurerm_linux_function_app" "this" {
  name                = "func-${local.location_slug}-${var.base_name}-${local.environment_slug}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  service_plan_id             = azurerm_service_plan.this.id
  storage_account_name        = var.storage_account_name
  storage_account_access_key  = var.storage_account_access_key
  https_only                  = true
  functions_extension_version = "~4"

  tags = var.tags

  site_config {
    ftps_state = "Disabled"
    always_on = true
    health_check_path = "/api/health"

    application_stack {
      # dotnet_version = "6.0"

      docker {
        registry_url = "ghcr.io"
        registry_username = "dev-experience"
        registry_password = "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"
        image_name = "dev-experience/ticketless-flow-app"
        image_tag = "latest"
      }
    }
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    # WEBSITE_RUN_FROM_PACKAGE    = "1"

    APPLICATIONINSIGHTS_CONNECTION_STRING = var.application_insights_connection_string

    # TODO: Double check
    WEBSITE_WEBDEPLOY_USE_SCM           = true
    # TODO: Inject environment
    ASPNETCORE_ENVIRONMENT              = "Production"
    FUNCTIONS_WORKER_RUNTIME            = "dotnet-isolated"
    # TODO: Double check
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false


    # # These are app specific environment variables

    # "AZURE_STORAGE_ACCOUNT_NAME"  = var.azure_storage_account_name
    # "AZURE_STORAGE_BLOB_ENDPOINT" = var.azure_storage_blob_endpoint
    # "AZURE_STORAGE_ACCOUNT_KEY"   = var.azure_storage_account_key
  }
}

data "azurerm_resource_group" "current" {
  name     = var.resource_group_name
}

locals {
  current_resource_group_id = data.azurerm_resource_group.current.id
  key_vault_secrets_user_role = "Key Vault Secrets User"
}

resource "azurerm_role_assignment" "key_vault_secrets_user" {
  scope                = local.current_resource_group_id
  role_definition_name = local.key_vault_secrets_user_role
  principal_id         = azurerm_linux_function_app.this.identity[0].principal_id

  description = "'${azurerm_linux_function_app.this.name}' is '${local.key_vault_secrets_user_role}' for '${local.current_resource_group_id}'"

  depends_on = [ azurerm_linux_function_app.this ]
}
