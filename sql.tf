resource "azurerm_mssql_server" "sql_server" {
  name                         = "bestrongsqlserver"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_user
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "DB" {
  depends_on = [ azurerm_mssql_server.sql_server ]
  name = "BeStrong-DB"
  server_id = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 2
  sku_name = "S0"
  min_capacity = 2
    
    lifecycle {
        prevent_destroy = false
      }

}


resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "BeStrong-private-endpoint-sql"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.private_endpoint_subnet.id

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
