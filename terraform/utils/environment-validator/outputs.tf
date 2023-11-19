module "constants" {
  source = "../../constants"
}

locals {
  environment_slug = module.constants.environments[var.input.value]
}

output "environment_slug" {
  value = local.environment_slug
}
