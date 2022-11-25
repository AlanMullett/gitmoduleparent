var tags = {
  environmentTag: ''
  parentBusinessTag: ''
  portfolioTag: ''
  productTag: ''
  serviceLineTag: ''
  serviceOfferingTag: ''
}

module app_service_plan '../../funding-platform-building-blocks/templates/app-service-plan.json' = {
  name: 'app-service-plan'
  params: {
    appServicePlanName: 'pipeline-asp-01'
    aspLocation: 'West Europe'
    aspSize: '1'
    aspInstances: 1
    nonASETier: 'Standard'
    environmentTag: tags.environmentTag
    parentBusinessTag: tags.parentBusinessTag
    portfolioTag: tags.portfolioTag
    productTag: tags.productTag
    serviceLineTag: tags.serviceLineTag
    serviceOfferingTag: tags.serviceOfferingTag
  }
}

module app_service '../../funding-platform-building-blocks/templates/app-service.json' = {
  name: 'app-service'
  params: {
    appServiceName: 'pipeline-app-01'
    appServicePlanName: 'pipeline-asp-01'
    appServicePlanResourceGroup: 'pipeline-rg'
    http20Enabled: true
    ftpsState: 'Disabled'
    environmentTag: tags.environmentTag
    parentBusinessTag: tags.parentBusinessTag
    portfolioTag: tags.portfolioTag
    productTag: tags.productTag
    serviceLineTag: tags.serviceLineTag
    serviceOfferingTag: tags.serviceOfferingTag
  }
  dependsOn: [
    app_service_plan
  ]
}

module function_app '../../funding-platform-building-blocks/templates/function-app.json' = {
  name: 'function-app'
  params: {
    functionAppName: 'pipeline-func-01'
    appServicePlanName: 'pipeline-asp-01'
    appServicePlanResourceGroup: 'pipeline-rg'
    http20Enabled: true
    ftpsState: 'Disabled'
    environmentTag: tags.environmentTag
    parentBusinessTag: tags.parentBusinessTag
    portfolioTag: tags.portfolioTag
    productTag: tags.productTag
    serviceLineTag: tags.serviceLineTag
    serviceOfferingTag: tags.serviceOfferingTag
  }
  dependsOn: [
    app_service_plan
  ]
}
