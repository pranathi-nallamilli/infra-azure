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
node_resource_group = "node-rgdeloitte1"
storage_account_name   = "azdisney1" 
cluster_name        = "disney-aks" 
kubernetes_version  = "1.19.13"
system_node_count   = 2
vm_size             = "Standard_B1ls"
storage_container_name = "discontainer"
sku                 = "basic"
nsg_name = "disg"
vnet_name = "disvnet"
address_space = "10.0.0.0/16"
}















