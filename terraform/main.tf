terraform {
  required_providers {
    arm2tf = {
      source = "cloud-maker-ai/arm2tf"
    }
  }
}

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
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment

  tags                = local.tags
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = var.resource_group_name
  location            = var.location
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment

  tags = local.tags
}

module "key_vault" {
  source              = "./modules/key-vault"
  resource_group_name = var.resource_group_name
  location            = var.location
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment

  tags = local.tags
}

module "function_app" {
  source              = "./modules/function-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  base_name           = arm2tf_unique_string.unique_base_name.id
  environment         = var.environment

  tags = local.tags

  application_insights_connection_string = module.application_insights.connection_string

  storage_account_name       = module.storage_account.name
  storage_account_access_key = module.storage_account.access_key

  docker_registry_url      = var.docker_registry_url
  docker_registry_username = var.docker_registry_username
  docker_registry_password = var.docker_registry_password

  docker_image_namespace = var.docker_image_namespace
  docker_image_name      = var.docker_image_name
  docker_image_tag       = var.docker_image_tag

  environment_variables = var.app_environment_variables

  depends_on = [ module.storage_account, module.application_insights, module.key_vault ]
}
