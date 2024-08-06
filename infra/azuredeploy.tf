variable "staticSites_name" {
  default = "azure-static-web-apps-001"
}

resource "azurerm_static_site" "example" {
  name                = var.staticSites_name
  location            = "East Asia"
  resource_group_name = azurerm_resource_group.example.name
  sku_tier            = "Free"
  repository_url      = "https://github.com/raj-oo8/github-services"
  branch              = "main"
  staging_environment_policy  = "Enabled"
  allow_config_file_updates   = true
  provider                    = "GitHub"
  enterprise_grade_cdn_status = "Disabled"
}

resource "azurerm_static_site_basic_auth" "example" {
  static_site_id               = azurerm_static_site.example.id
  name                         = "default"
  applicable_environments_mode = "SpecifiedEnvironments"
}
