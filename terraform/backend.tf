terraform {
  backend "azurerm" {
    subscription_id      = "8a5d8372-6c08-4017-8642-29bde3b6432e"
    resource_group_name  = "rg-cu-ticketless-flow-terraform"
    storage_account_name = "tklflwterraform"
    container_name       = "tfstate-${local.environment_slug}"
    key                  = "terraform.tfstate"
  }
}
