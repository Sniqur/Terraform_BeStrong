resource "azurerm_storage_account" "storage" {
  name                     =  "storageforbestrong"
  resource_group_name      = var.BeStrong_RG_name
  location                 = var.BeStrong_RG_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.main ]
}

resource "azurerm_storage_share" "fileshare" {
  name                 = "bestrong-fs"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50
}

resource "azurerm_private_endpoint" "storage_private_endpoint" {
  name                = "example-storage-private-endpoint"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.private_endpoint_subnet.id

  private_service_connection {
    name                           = "storage-private-connection"
    private_connection_resource_id = azurerm_storage_account.storage.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }
}
