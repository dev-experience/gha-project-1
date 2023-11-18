variable "application_insights_connection_string" {
  type        = string
  description = "Azure Application Insights connection string"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name"
}

variable "storage_account_access_key" {
  type        = string
  sensitive = true
  description = "Storage Account access key"
}

variable "environment_variables" {
  type = map(string)
  description = "Custom environment variables"
}

variable "docker_registry_url" {
  type = string
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
