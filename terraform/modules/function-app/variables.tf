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
