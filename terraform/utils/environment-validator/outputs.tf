module "constants" {
  source = "../../constants"
}

locals {
  environment_slug = module.constants.allowed_environments[var.environment.value].slug
}

output "environment_slug" {
  value = local.environment_slug
}
