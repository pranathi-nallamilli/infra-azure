resource "azurerm_container_registry" "acr" {
  name                = "disacr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
  # georeplications = [
  #   {
  #     location                = var.location
  #     zone_redundancy_enabled = false
  #     tags                    = {}
  #   }]
}