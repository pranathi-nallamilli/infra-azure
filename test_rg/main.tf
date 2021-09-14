provider "azurerm" {
  version = ">=2.28.0"
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location
}
