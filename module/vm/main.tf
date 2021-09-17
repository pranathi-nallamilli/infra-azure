resource "azurerm_network_interface" "main" {
  name                = var.interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name = "disconfiguration"
    # subnet_id                    =  "${module.vnet.azurerm_subnet.id}"
    #subnet_id                     =  ${azurerm_subnet.example.id}
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_virtual_machine" "test" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  # admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1ls"

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = var.disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}
