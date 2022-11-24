$armOutput = New-AzResourceGroupDeployment `
    -ResourceGroupName pipeline-rg `
    -TemplateFile '.\platform\azure\template.bicep'
