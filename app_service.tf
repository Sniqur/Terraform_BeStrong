resource "azurerm_service_plan" "asp" {
  name                = "BeStrong_ASP"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku_name            = "B1"
  os_type             = "Linux"
depends_on = [ azurerm_storage_account.storage ]
}

resource "azurerm_linux_web_app" "app" {
  name                = "BeStrongAS"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.asp.id
  # virtual_network_subnet_id = azurerm_subnet.default.id
  site_config {
    always_on = false
  }


  storage_account {
    name         = azurerm_storage_account.storage.name
    account_name = azurerm_storage_account.storage.name
    access_key   = azurerm_storage_account.storage.primary_access_key
    share_name   = azurerm_storage_share.fileshare.name
    mount_path   = "/mnt/fileshare"
    type         = "AzureFiles"


  }
  identity {
    type = "SystemAssigned"

  }
  depends_on = [azurerm_storage_share.fileshare]
}

# Інтеграція App Service з підмережею VNet через Swift Connection
resource "azurerm_app_service_virtual_network_swift_connection" "app_vnet_integration" {
  app_service_id = azurerm_linux_web_app.app.id
  subnet_id      = azurerm_subnet.default.id
}
