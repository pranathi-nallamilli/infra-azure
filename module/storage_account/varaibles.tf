#
variable "storage_account_name" {
  type        = string
  description = "Name of Storage Account"
}

variable "resource_group_name" {
  type        = string
#  default     = "rgdeloitte1"
  description = "Name of resource group"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Enter location"
}

variable "account_tier" {
  type        = string
  description = "Enter storage account tier"
}

variable "account_replication_type" {
  type        = string
  description = "Enter storage account replication type"
}
