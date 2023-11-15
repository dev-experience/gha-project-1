terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.76.0"
    }
    arm2tf = {
      source  = "cloud-maker-ai/arm2tf"
      version = "~> 0.2.2"
    }
  }
}
