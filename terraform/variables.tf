module "constants" {
  source = "./constants"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

module "subscription_id_validator" {
  source = "./utils/subscription-id-validator"

  input = {
    value = var.subscription_id
    regex = module.constants.uuid_regex
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "base_name" {
  type        = string
  description = "Base name for all resources"
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
