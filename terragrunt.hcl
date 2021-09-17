terraform {
  source = ".///"
}

remote_state {
    backend = "azurerm"
    generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
    }
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name = "demo1"
        storage_account_name   = "azdisney" 
        container_name = "disneytest"
        #key = "dis.terraform.tfstate"
    }
 }

inputs = {
location = "East US"
resource_group_name = "rgdeloitte1"
storage_account_name   = "azdisney1"  
storage_container_name = "discontainer"
nsg_name = "disg"
vnet_name = "disvnet"
address_space = "10.0.0.0/16"
}















