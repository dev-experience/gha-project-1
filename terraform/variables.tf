variable "subscription_id" {
  type        = string
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
}

variable "location" {
  type        = string
  description = "The Azure region where all resources in this example should be created"
}

variable "tag_business_unit" {
  type        = string
  description = "Tag for Business Unit"
}
