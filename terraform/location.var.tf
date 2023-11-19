variable "location" {
  type        = string
  description = "The Azure region where resources should be created"
}

module "location_validator" {
  source = "./utils/location-validator"

  input = {
    value = var.location
    regex = module.constants.regions_regex
  }
}

locals {
  location_slug = module.location_validator.location_slug
}
