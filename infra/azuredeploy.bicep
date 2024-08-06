param staticSites_name string = 'azure-static-web-apps-001'
param location string = 'East Asia'
param repositoryUrl string
param branch string = 'main'
param repositoryToken string

resource staticSite 'Microsoft.Web/staticSites@2023-01-01' = {
  name: staticSites_name
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    repositoryToken: repositoryToken
  }
}
