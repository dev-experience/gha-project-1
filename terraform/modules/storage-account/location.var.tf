variable "location" {
  type        = string
  description = "The Azure region where resources should be created"
}

module "constants" {
  source = "../../constants"
}

module "validate_location" {
  source = "../../utils/validate-location"

  location = {
    location = var.location
    region_regex = module.constants.regions_regex
  }
}

locals {
  location_slug = module.validate_location.location_slug
}
