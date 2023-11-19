variable "input" {
  type = object({
    value     = string
    allowed_values = map(string)
  })
  description = "The Azure region where resources should be created"

  validation {
    condition     = contains(var.input.allowed_values, var.input.value)
    error_message = "Invalid environment name, must be one of '${concat(keys(var.input.allowed_values), "', '")}'"
  }
}
