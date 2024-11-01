terraform {
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = ">=3.0"
  }
}
required_version = "1.9.8"
  backend "azurerm" {
    resource_group_name  = "bestrong-rg-backend-australia"
    storage_account_name = "bestrongsabackend"
    container_name       = "bestrong-cont-back"
    key                  = "terraform.tfstate"
    use_oidc = true
  }
}

# resource "azurerm_storage_account" "terraform_state" {
#   name                     = "bestrongtfstate"
#   resource_group_name      = azurerm_resource_group.main.name
#   location                 = azurerm_resource_group.main.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "terraform_state" {
#   name                  = "tfstate"
#   storage_account_name  = azurerm_storage_account.terraform_state.name
#   # container_access_type = "private"
# }