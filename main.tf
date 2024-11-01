provider "azurerm" {

  features {
    # key_vault {
    #   purge_soft_delete_on_destroy = false
    # }
  }
  subscription_id = "1a8f5438-2e23-4a1f-b53c-3ebf42a36c48"
}

resource "azurerm_resource_group" "main" {
  name     = var.BeStrong_RG_name
  location = var.BeStrong_RG_location
}
