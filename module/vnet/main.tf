
resource "azurerm_network_security_group" "disg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  #depends_on = [azurerm_resource_group.example]
}

resource "azurerm_virtual_network" "disvnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["${var.address_space}"]
}

resource "azurerm_subnet" "example" {
  name                 = "pubsub1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.disvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}








# resource "azurerm_virtual_network" "example" {
#   name                = "${var.prefix}-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }



  # subnet {
  #   name           = "pubsub1"
  #   address_prefix = "10.0.1.0/24"
  # }

  # subnet {
  #   name           = "pubsub2"
  #   address_prefix = "10.0.2.0/24"
  # }

  # subnet {
  #   name           = "privsub3"
  #   address_prefix = "10.0.3.0/24"
  #   security_group = azurerm_network_security_group.disg.id
  # }

  # subnet {
  #   name           = "privsub4"
  #   address_prefix = "10.0.4.0/24"
  #   security_group = azurerm_network_security_group.disg.id
  # } 





