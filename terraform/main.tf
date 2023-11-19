provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

data "azurerm_subscription" "current" {
}

locals {
  tags = {
    "Environment" : var.environment
    "Business Unit" : var.tag_business_unit
  }
}

resource "arm2tf_unique_string" "unique_base_name" {
  input = [ data.azurerm_subscription.current.subscription_id, var.base_name ]
}

module "storage_account" {
  source              = "./modules/storage-account"
  resource_group_name = var.resource_group_name
  location            = var.location
  location_slug       = local.location_slug
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment
  environment_slug    = local.environment_slug

  tags                = local.tags
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = var.resource_group_name
  location            = var.location
  location_slug       = local.location_slug
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment
  environment_slug    = local.environment_slug

  tags = local.tags
}

module "key_vault" {
  source              = "./modules/key-vault"
  resource_group_name = var.resource_group_name
  location            = var.location
  location_slug       = local.location_slug
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment
  environment_slug    = local.environment_slug

  tags = local.tags
}

module "function_app" {
  source              = "./modules/function-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  location_slug       = local.location_slug
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment
  environment_slug    = local.environment_slug

  tags = local.tags

  application_insights_connection_string = module.monitoring.application_insights_connection_string

  storage_account_name       = module.storage_account.name
  storage_account_access_key = module.storage_account.access_key

  docker_registry_url      = var.docker_registry_url
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password

  docker_image_namespace = var.docker_image_namespace
  docker_image_name      = var.docker_image_name
  docker_image_tag       = var.docker_image_tag

  environment_variables = {
    # TODO: Enable once Key Vault secret is created via Azure Portal
    "XTZ_CoreConnect__ApiKey" = "@Microsoft.KeyVault(SecretUri=${module.key_vault.uri}secrets/XTZ-CoreConnect-ApiKey/)"
    "XTZ_CorrelationGenerator__Prefix" = "TicketlessFlow"
  }

  depends_on = [ module.storage_account, module.monitoring, module.key_vault ]
}
