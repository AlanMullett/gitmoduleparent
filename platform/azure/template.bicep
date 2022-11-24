module app_service_plan '../../tl-platform-building-blocks/ArmTemplates/app-service-plan-ase.json' = {
  name: 'app-service-plan'
  params: {
    appServicePlanName: 'pipeline-asp-01'
    aspLocation: 'West Europe'
    aspSize: '1'
    aspInstances: 1
    nonASETier: 'Standard'
  }
}

module app_service '../../tl-platform-building-blocks/ArmTemplates/app-service.json' = {
  name: 'app-service'
  params: {
    appServiceName: 'pipeline-app-01'
    appServicePlanName: 'pipeline-asp-01'
    appServicePlanResourceGroup: 'pipeline-rg'
    http20Enabled: true
    ftpsState: 'Disabled'
  }
  dependsOn: [
    app_service_plan
  ]
}

module function_app '../../tl-platform-building-blocks/ArmTemplates/function-app.json' = {
  name: 'function-app'
  params: {
    functionAppName: 'pipeline-func-01'
    appServicePlanName: 'pipeline-asp-01'
    appServicePlanResourceGroup: 'pipeline-rg'
    http20Enabled: true
    ftpsState: 'Disabled'
  }
  dependsOn: [
    app_service_plan
  ]
}
