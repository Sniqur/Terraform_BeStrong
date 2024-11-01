resource "azurerm_key_vault" "kv" {
  name                        = "bestrong-kv1"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled = false 

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    virtual_network_subnet_ids = [azurerm_subnet.default.id]
  }
}

resource "azurerm_key_vault_access_policy" "app_service_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_linux_web_app.app.identity[0].principal_id

  secret_permissions = ["Get", "List"]
}
