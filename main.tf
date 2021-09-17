

module "test_rg" {
  source              = "/mnt/c/Projects/infra_azure/module/test_rg"
  resource_group_name = "rgdeloitte1"
  location            = "eastus"
}
module "storage_account" {
  source = "/mnt/c/Projects/infra_azure/module/storage_account"

  storage_account_name     = "azdisney2"
  resource_group_name      = module.test_rg.resource_group_name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "vnet" {
  source              = "/mnt/c/Projects/infra_azure/module/vnet"
  vnet_name           = "disvnet"
  nsg_name            = "disg"
  address_space       = "10.0.0.0/16"
  location            = "eastus"
  resource_group_name = module.test_rg.resource_group_name

}

module "vm" {
  source              = "/mnt/c/Projects/infra_azure/module/vm"
  count               = 4
  vm_name             = "disvm${count.index + 1}"
  interface_name      = "disnic${count.index + 1}"
  disk_name           =  "disneydisk${count.index + 1}"
  location            = "eastus"
  resource_group_name = module.test_rg.resource_group_name
  subnet_id           = module.vnet.subnet_id

}

