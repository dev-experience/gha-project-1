data "azurerm_resource_group" "current" {
  name     = var.resource_group_name
}

resource "azurerm_service_plan" "this" {
  name                = "asp-${var.location_slug}-${var.base_name}-${var.environment_slug}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_name = "B1"
  os_type  = "Linux"

  tags = var.tags
}

locals {
  azure_functions_app_name = "func-${var.location_slug}-${var.base_name}-${var.environment_slug}"

  current_resource_group_id = data.azurerm_resource_group.current.id
  key_vault_secrets_user_role = "Key Vault Secrets User"

  defaultAppSettings = {
    # WEBSITE_RUN_FROM_PACKAGE    = "1"

    AzureWebJobsStorage = "DefaultEndpointsProtocol=https;AccountName=${var.storage_account_name};AccountKey=${var.storage_account_access_key}"

    # TODO: Double check
    WEBSITE_WEBDEPLOY_USE_SCM           = true
    ASPNETCORE_ENVIRONMENT              = var.environment
    FUNCTIONS_WORKER_RUNTIME            = "dotnet-isolated"
    # TODO: Double check
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  }

  app_settings = merge(local.defaultAppSettings, var.environment_variables)
}

resource "azurerm_linux_function_app" "this" {
  name                        = local.azure_functions_app_name
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
    application_insights_connection_string = var.application_insights_connection_string

    application_stack {
      docker {
        registry_url = var.docker_registry_url
        registry_username = var.docker_registry_username
        registry_password = var.docker_registry_password
        image_name = "${var.docker_image_namespace}/${var.docker_image_name}"
        image_tag = var.docker_image_tag
      }
    }

    cors {
      allowed_origins = [ "https://portal.azure.com" ]
    }
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = local.app_settings
}

resource "azurerm_role_assignment" "key_vault_secrets_user" {
  scope                = local.current_resource_group_id
  role_definition_name = local.key_vault_secrets_user_role
  principal_id         = azurerm_linux_function_app.this.identity[0].principal_id

  description = "'${azurerm_linux_function_app.this.name}' is '${local.key_vault_secrets_user_role}' for '${local.current_resource_group_id}'"

  depends_on = [ azurerm_linux_function_app.this ]
}

locals {
  azure_functions_app_webhook_url = "https://${azurerm_linux_function_app.this.site_credential.0.name}:${azurerm_linux_function_app.this.site_credential.0.password}@${azurerm_linux_function_app.this.name}.scm.azurewebsites.net/api/registry/webhook"
}
