# output "id" {
#   description = "The ids of subnets created inside the new vNet"
#   value       = "${azurerm_virtual_network.disvnet.subnet.*.id}"
# }


output "subnet_id" {
  description = "The ids of subnets created inside the new vNet"
  value       = "${azurerm_subnet.example.id}"
}