variable "location" {
  type = object({
    location     = string
    region_regex = string
  })
  description = "The Azure region where resources should be created"

  validation {
    condition     = can(regex(var.location.region_regex, var.location.location))
    error_message = "Invalid location, only valid Azure Regions are allowed"
  }
}
