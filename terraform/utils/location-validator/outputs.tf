module "constants" {
  source = "../../constants"
}

locals {
  location_slug = module.constants.regions[var.input.value].slug
}

output "location_slug" {
  value = local.location_slug
}
