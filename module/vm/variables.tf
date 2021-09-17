variable "location" {
  description = "Location of the Virtual Net"
}

variable "resource_group_name" {
  description = "Resource Group Name for the virtual net"
}

variable "interface_name" {
  description = "Name of the interface to create"
  default     = ""
}

variable "network_interface_ids" {
  description = "Enter Network Interface ID"
  default     = ""
}

variable "vm_name" {
  description = "The vm name"
  default     = ""
}

variable "disk_name" {
  description = "The disk name"
  default     = ""
}



# variable "admin_name" {
#   type        = string
#   description = "Enter admin username"
# }

variable "subnet_id" {
  description = "The subnetid"
  default     = ""
}




