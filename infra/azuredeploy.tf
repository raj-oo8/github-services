provider "azurerm" {
  features {}
}

variable "staticSites_name" {
  description = "The name of the static site"
  type        = string
  default     = "azure-static-web-apps-001"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = "East Asia"
}

resource "azurerm_static_web_app" "example" {
  name                = var.staticSites_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_tier            = "Free"
}
