module "shared" {
  source      = "../shared"
  subscription_id = var.subscription_id
  resource_group_name = var.resource_group_name
  environment = var.environment

  base_name = var.base_name
  location = var.location
  tag_business_unit = var.tag_business_unit
}
