param resourceGroupPrefix string 

var resourceGroupName = '${resourceGroupPrefix}-rg'
var appServicePlanName = '${resourceGroupPrefix}-asp-01'
var appServiceName = '${resourceGroupPrefix}-app-01'
var functionAppName = '${resourceGroupPrefix}-func-01'

// var tags = {
//   environmentTag: '${resourceGroupPrefix}-environment'
//   parentBusinessTag: '${resourceGroupPrefix}-business'
//   portfolioTag: '${resourceGroupPrefix}-portfolio'
//   productTag: '${resourceGroupPrefix}-product'
//   serviceLineTag: '${resourceGroupPrefix}-serviceLine'
//   serviceOfferingTag: '${resourceGroupPrefix}-serviceOffering'
// }
module app_service_plan '../../funding-platform-building-blocks/templates/app-service-plan.json' = {
  name: 'app-service-plan'
  params: {
    appServicePlanName: appServicePlanName
    aspLocation: 'West Europe'
    aspSize: '1'
    aspInstances: 1
    nonASETier: 'Standard'
    // environmentTag: tags.environmentTag
    // parentBusinessTag: tags.parentBusinessTag
    // portfolioTag: tags.portfolioTag
    // productTag: tags.productTag
    // serviceLineTag: tags.serviceLineTag
    // serviceOfferingTag: tags.serviceOfferingTag
  }
}

module app_service '../../funding-platform-building-blocks/templates/app-service.json' = {
  name: 'app-service'
  params: {
    appServiceName: appServiceName
    appServicePlanName: appServicePlanName
    appServicePlanResourceGroup: resourceGroupName
    http20Enabled: true
    ftpsState: 'Disabled'
    // environmentTag: tags.environmentTag
    // parentBusinessTag: tags.parentBusinessTag
    // portfolioTag: tags.portfolioTag
    // productTag: tags.productTag
    // serviceLineTag: tags.serviceLineTag
    // serviceOfferingTag: tags.serviceOfferingTag
  }
  dependsOn: [
    app_service_plan
  ]
}

module function_app '../../funding-platform-building-blocks/templates/function-app.json' = {
  name: 'function-app'
  params: {
    functionAppName: functionAppName
    appServicePlanName: appServicePlanName
    appServicePlanResourceGroup: resourceGroupName
    http20Enabled: true
    ftpsState: 'Disabled'
    // environmentTag: tags.environmentTag
    // parentBusinessTag: tags.parentBusinessTag
    // portfolioTag: tags.portfolioTag
    // productTag: tags.productTag
    // serviceLineTag: tags.serviceLineTag
    // serviceOfferingTag: tags.serviceOfferingTag
  }
  dependsOn: [
    app_service_plan
  ]
}
