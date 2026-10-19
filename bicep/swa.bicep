targetScope = 'resourceGroup'

@description('Static Web App name')
param name string

@description('Azure region')
param location string

@description('Static Web App SKU')
@allowed([
  'Free'
  'Standard'
])
param sku string = 'Free'

resource staticWebApp 'Microsoft.Web/staticSites@2023-12-01' = {
  name: name
  location: location
  sku: {
    name: sku
    tier: sku
  }
}

@description('Default hostname of the Static Web App')
output defaultHostname string = staticWebApp.properties.defaultHostname

@description('Static Web App resource name')
output name string = staticWebApp.name
