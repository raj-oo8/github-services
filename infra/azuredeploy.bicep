param staticSites_name string = 'azure-static-web-apps-001'
param repositoryUrl string
param branch string = 'main'

resource staticSite 'Microsoft.Web/staticSites@2023-01-01' = {
  name: staticSites_name
  location: 'East Asia'
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    provider: 'GitHub'
  }
}
