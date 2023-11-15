variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "environment" {
  type        = string
  description = "The environment (Development, Test, Acceptance, Production)"
}

variable "base_name" {
  type        = string
  description = "Base name for all resources"
}

variable "location" {
  type        = string
  description = "The Azure region where all resources in this example should be created"
}

variable "tag_business_unit" {
  type        = string
  description = "Tag for Business Unit"
}
