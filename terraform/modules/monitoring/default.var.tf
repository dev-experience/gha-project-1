variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "The Azure region where resources should be created"
}

variable "location_slug" {
  type        = string
  description = "The Azure region slug"
}

variable "base_name" {
  type        = string
  description = "Base name for all resources"
}

variable "environment" {
  type        = string
  description = "The app environment"
}

variable "environment_slug" {
  type        = string
  description = "The app environment slug"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}
