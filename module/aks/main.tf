
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  node_resource_group = var.node_resource_group
  private_cluster_enabled = true

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    type                = "VirtualMachineScaleSets"
    vm_size             = "Standard_D2_v2"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 1
    max_pods            = 30
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet" # CNI
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "node_pools" {
  name                = "disaks"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size             = "Standard_D2_v2"
  os_type             = "Linux"
  os_disk_size_gb     = 30
  node_count          = var.system_node_count
  enable_auto_scaling = true
  min_count             = 1
  max_count             = 1 

}