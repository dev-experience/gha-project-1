variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "base_name" {
  type        = string
  description = "Base name for all resources"
}

variable "environment" {
  type        = string
  description = "The environment (Development, Test, Acceptance, Production)"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}

locals {
  environment_slug = module.constants.environment_slugs[var.environment]
}
