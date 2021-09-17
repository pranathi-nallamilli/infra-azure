output "resource_group_name" {
  description = "The ids of subnets created inside the new vNet"
  value       = "${azurerm_resource_group.example.name}"
}