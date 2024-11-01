resource "azurerm_application_insights" "app_insights" {
  name                = "BeStrong-APP-INS"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.log_workspace.id

}
resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = "example-log-analytics"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
}
