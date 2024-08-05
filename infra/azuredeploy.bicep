param staticSites_azure_static_web_apps_001_name string = 'azure-static-web-apps-001'

resource staticSite 'Microsoft.Web/staticSites@2023-01-01' = {
  name: staticSites_azure_static_web_apps_001_name
  location: 'East Asia'
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: 'https://github.com/raj-oo8/github-services'
    branch: 'main'
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    provider: 'GitHub'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}

resource staticSiteBasicAuth 'Microsoft.Web/staticSites/basicAuth@2023-01-01' = {
  parent: staticSite
  name: 'default'
  properties: {
    applicableEnvironmentsMode: 'SpecifiedEnvironments'
  }
}

output staticWebAppName string = staticSite.name
