param sharedResourceGroupPrefix string 

var tags = {
  environmentTag: '${sharedResourceGroupPrefix}-environment'
  parentBusinessTag: '${sharedResourceGroupPrefix}-business'
  portfolioTag: '${sharedResourceGroupPrefix}-portfolio'
  productTag: '${sharedResourceGroupPrefix}-product'
  serviceLineTag: '${sharedResourceGroupPrefix}-serviceLine'
  serviceOfferingTag: '${sharedResourceGroupPrefix}-serviceOffering'
}

var keyVaultName = '${sharedResourceGroupPrefix}-kv-01'

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
