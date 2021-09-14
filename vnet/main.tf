resource "azurerm_network_security_group" "disg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "disvnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["${var.address_space}"]

  subnet {
    name           = "pubsub1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "pubsub2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "privsub3"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.disg.id
  }

  subnet {
    name           = "privsub4"
    address_prefix = "10.0.4.0/24"
    security_group = azurerm_network_security_group.disg.id
  } 
}