param sharedResourceGroupPrefix string 

// var tags = {
//   environmentTag: '${sharedResourceGroupPrefix}-environment'
//   parentBusinessTag: '${sharedResourceGroupPrefix}-business'
//   portfolioTag: '${sharedResourceGroupPrefix}-portfolio'
//   productTag: '${sharedResourceGroupPrefix}-product'
//   serviceLineTag: '${sharedResourceGroupPrefix}-serviceLine'
//   serviceOfferingTag: '${sharedResourceGroupPrefix}-serviceOffering'
// }

var keyVaultName = '${sharedResourceGroupPrefix}-kv-01'

module sharedKeyVault './tl-platform-building-blocks/templates/keyvault.json' = {
  name: 'sharedKeyVault'
  params: {
    keyVaultName: keyVaultName
    enableSoftDelete: true
    enabledForTemplateDeployment: true
  }
}

output keyVaultName string = keyVaultName
