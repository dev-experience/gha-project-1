provider "azurerm" {
  subscription_id = var.subscription_id
  features {
  }
}

locals {
  tags = {
    "Environment" : var.environment
    "Business Unit" : var.tag_business_unit
  }
}

/*

# locals {
#   defaults = {
#     project_name = "project-default"
#     region_name  = "region-default"
#   }
# }

locals {
  development = {
    Development = {
      environment = "Development"
    }
  }
}

locals {
  production = {
    Production = {
      environment = "Production"
    }
  }
}

locals {
  workspaces = merge(local.development, local.production)
  # workspace  = merge(local.defaults, local.workspaces[terraform.workspace])
  workspace  = local.workspaces[terraform.workspace]
}

output "region_name" {
  value = "${local.workspace["region_name"]}"
}

*/

module "storage_account" {
  source              = "./modules/storage-account"
  resource_group_name = var.resource_group_name
  location            = var.location
  base_name           = var.base_name
  environment         = var.environment

  tags                = local.tags
}

module "application_insights" {
  source              = "./modules/application-insights"
  resource_group_name = var.resource_group_name
  location            = var.location
  base_name           = var.base_name
  environment         = var.environment

  tags = local.tags
}

module "key_vault" {
  source              = "./modules/key-vault"
  resource_group_name = var.resource_group_name
  location            = var.location
  base_name           = var.base_name
  environment         = var.environment

  tags = local.tags
}

module "function_app" {
  source              = "./modules/function-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  base_name           = var.base_name
  environment         = var.environment

  tags = local.tags

  application_insights_connection_string = module.application_insights.connection_string

  storage_account_name       = module.storage_account.name
  storage_account_access_key = module.storage_account.access_key

  depends_on = [ module.storage_account, module.application_insights, module.key_vault ]
}
