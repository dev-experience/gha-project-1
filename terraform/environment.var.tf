variable "environment" {
  type        = string
  description = "The app environment"
}

module "environment_validator" {
  source = "./utils/environment-validator"

  input = {
    value = var.environment
    allowed_values = module.constants.allowed_environments
  }
}

locals {
  environment_slug = module.environment_validator.environment_slug
}
