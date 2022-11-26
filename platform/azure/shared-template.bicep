param resourceGroupPrefix string 

var tags = {
  environmentTag: '${resourceGroupPrefix}-environment'
  parentBusinessTag: '${resourceGroupPrefix}-business'
  portfolioTag: '${resourceGroupPrefix}-portfolio'
  productTag: '${resourceGroupPrefix}-product'
  serviceLineTag: '${resourceGroupPrefix}-serviceLine'
  serviceOfferingTag: '${resourceGroupPrefix}-serviceOffering'
}

var keyVaultName = '${resourceGroupPrefix}-kv-01'

module sharedKeyVault '../../funding-platform-building-blocks/templates/keyvault.json' = {
  name: 'sharedKeyVault'
  params: {
    keyVaultName: keyVaultName
    enableSoftDelete: true
    enabledForTemplateDeployment: true
    environmentTag: tags.environmentTag
    parentBusinessTag: tags.parentBusinessTag
    portfolioTag: tags.portfolioTag
    productTag: tags.productTag
    serviceLineTag: tags.serviceLineTag
    serviceOfferingTag: tags.serviceOfferingTag
  }
}

output keyVaultName string = keyVaultName

