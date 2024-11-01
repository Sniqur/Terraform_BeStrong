resource "azurerm_container_registry" "acr" {
  name                = "BeStorngACR"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acr_access" {
  principal_id         = azurerm_linux_web_app.app.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
  depends_on = [ azurerm_linux_web_app.app ]
}
