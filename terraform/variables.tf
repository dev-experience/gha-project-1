module "constants" {
  source = "./constants"
}

variable "subscription_id" {
  type        = string
  validation {
    condition     = can(regex(module.constants.uuid_regex, var.subscription_id))
    error_message = "Invalid subscription ID, must be a valid Azure subscription ID"
  }
  description = "Subscription ID"
}

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

  validation {
    condition = contains(module.constants.allowed_environments, var.environment)
    error_message = "Invalid environment name, must be one of '${concat(module.constants.allowed_environments, "', '")}'"
  }
}

variable "tag_business_unit" {
  type        = string
  description = "Tag for Business Unit"
}

variable "docker_registry_url" {
  type        = string
  description = "Docker registry URL"
}

variable "docker_registry_username" {
  type = string
  description = "Docker registry username"
}

variable "docker_registry_password" {
  type = string
  sensitive = true
  description = "Docker registry password"
}

variable "docker_image_namespace" {
  type = string
  description = "Docker image namespace"
}

variable "docker_image_name" {
  type = string
  description = "Docker image name"
}

variable "docker_image_tag" {
  type = string
  description = "Docker image tag"
}

variable "app_environment_variables" {
  type = map(string)
  description = "Application environment variables"
}

locals {
  environment_slug = module.constants.environment_slugs[var.environment]
}
