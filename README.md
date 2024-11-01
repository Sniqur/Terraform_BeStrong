###BeStrong
  Terraform code for configuration of the following bunch of resources:< br / >

1 App Service Plan< br / >
1 App Service - integrate with VNet, enable System Managed Identity< br / >
1 Application Insights - linked to App Service< br / >
1 ACR - Azure Container Registry, grant App Service Identity access to it< br / >
1 Key Vault - grant permissions to App Service Identity, integrate with VNet< br / >
1 VNet< br / >
1 MS SQL Server DB - Private Endpoint needs to be configured< br / >
1 Storage account - configure Private Endpoint with VNET and mount Fileshare to App Service< br / >
1 Storage account for Terraform state< br / >

