terraform {
  backend "azurerm" {
    subscription_id      = "8a5d8372-6c08-4017-8642-29bde3b6432e"
    storage_account_name = "tklflwterraform"
    resource_group_name  = "rg-cu-ticketless-flow-terraform"
    container_name       = "tfstate-t"
    key                  = "terraform.tfstate"
  }
}
