terraform {
  backend "azurerm" {
    subscription_id      = "8a5d8372-6c08-4017-8642-29bde3b6432e"
    resource_group_name  = "rg-we-ticketless-flow-terraform"
    storage_account_name = "tklflwterraform"
    container_name       = "tfstate2"
    key                  = "terraform.tfstate"
  }
}
