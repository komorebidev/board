targetScope = 'subscription'

param location string ='japaneast'

@description('String to make resource names unique')
var resourceToken = uniqueString(subscription().subscriptionId, location)

var suffix = substring(subscription().id, length(subscription().id) - 4, 4)
var resourceGroupName = 'board-${suffix}'
var prefix = 'board'


@description('Create a resource group')
resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

@description('Create a static web app')
module swa 'br/public:avm/res/web/static-site:0.3.0' = {
  name: 'swa-deployment'
  scope: rg
  params: {
    name: {prefix}app-{suffix}
    location: location
    sku: 'Free'
  }
}

@description('Output the default hostname')
output endpoint string = swa.outputs.defaultHostname

@description('Output the static web app name')
output staticWebAppName string = swa.outputs.name
