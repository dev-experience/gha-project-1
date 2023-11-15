locals {
  location_slug = module.constants.regions[var.location.location].slug
}

output "location_slug" {
  value = local.location_slug
}
