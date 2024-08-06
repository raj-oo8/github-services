variable "staticSites_name" {
  default = "azure-static-web-apps-001"
}

resource "azurerm_static_web_app" "example" {
  name                = var.staticSites_name
  location            = "East Asia"
  resource_group_name = azurerm_resource_group.example.name
  sku_tier            = "Free"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_static_web_app_basic_auth" "example" {
  static_web_app_id            = azurerm_static_web_app.example.id
  name                         = "default"
  applicable_environments_mode = "SpecifiedEnvironments"
}

provider "azurerm" {
  features {}
}
