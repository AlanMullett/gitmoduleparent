param resourceGroupPrefix string 
param appServicePlanTier string
param appServicePlanInstances int

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

module app_service_plan './tl-platform-building-blocks/templates/app-service-plan.json' = {
  name: 'app-service-plan'
  params: {
    appServicePlanName: appServicePlanName
    aspLocation: 'West Europe'
    aspSize: appServicePlanTier
    aspInstances: appServicePlanInstances
    nonASETier: 'Standard'
  }
}

module app_service './tl-platform-building-blocks/ARMTemplates/app-service.json' = {
  name: 'app-service'
  params: {
    appServiceName: appServiceName
    appServicePlanName: appServicePlanName
    appServicePlanResourceGroup: resourceGroupName
    http20Enabled: true
    ftpsState: 'Disabled'
  }
  dependsOn: [
    app_service_plan
  ]
}

module function_app './tl-platform-building-blocks/ARMTemplates/function-app.json' = {
  name: 'function-app'
  params: {
    functionAppName: functionAppName
    appServicePlanName: appServicePlanName
    appServicePlanResourceGroup: resourceGroupName
    http20Enabled: true
    ftpsState: 'Disabled'
  }
  dependsOn: [
    app_service_plan
  ]
}
