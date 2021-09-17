# #
# resource "azurerm_resource_group" "example" {
#   name     = var.resource_group_name
#   location = var.location
# }

resource "azurerm_storage_account" "example" {
  name                        = var.storage_account_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  account_tier                = var.account_tier
  account_replication_type    = var.account_replication_type
#  depends_on = [azurerm_resource_group.example]
}
resource "azurerm_storage_container" "example" {
  name                  = "disneytest"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"

}

resource "azurerm_storage_blob" "example" {
  name                   = "disblob"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
}
resource "azurerm_storage_queue" "example" {
  name                 = "disqueue"
  storage_account_name = azurerm_storage_account.example.name
}

resource "azurerm_storage_share" "example" {
  name                 = "disfile"
  storage_account_name = azurerm_storage_account.example.name
}

resource "azurerm_storage_table" "example" {
  name                 = "distable"
  storage_account_name = azurerm_storage_account.example.name
}

