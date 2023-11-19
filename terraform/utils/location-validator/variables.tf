variable "input" {
  type = object({
    value     = string
    regex = string
  })
  description = "The Azure region where resources should be created"

  validation {
    condition     = can(regex(var.input.regex, var.input.value))
    error_message = "Invalid location, only valid Azure Regions are allowed"
  }
}
