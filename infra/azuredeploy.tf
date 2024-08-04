provider "azurerm" {
  features {}
}

variable "staticSites_azure_static_web_apps_001_name" {
  type    = string
  default = "azure-static-web-apps-001"
}

resource "azurerm_static_site" "example" {
  name                = var.staticSites_azure_static_web_apps_001_name
  location            = "East Asia"
  resource_group_name = azurerm_resource_group.example.name

  sku {
    name = "Free"
    tier = "Free"
  }

  repository_url              = "https://github.com/raj-oo8/github-services"
  branch                      = "main"
  staging_environment_policy  = "Enabled"
  allow_config_file_updates   = true
  provider                    = "GitHub"
  enterprise_grade_cdn_status = "Disabled"
}

resource "azurerm_static_site_basic_auth" "example" {
  name                = "${azurerm_static_site.example.name}/default"
  location            = "East Asia"
  resource_group_name = azurerm_resource_group.example.name

  depends_on = [
    azurerm_static_site.example
  ]

  applicable_environments_mode = "SpecifiedEnvironments"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East Asia"
}
