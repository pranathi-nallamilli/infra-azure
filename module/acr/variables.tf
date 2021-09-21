variable "resource_group_name" {
  description = "RG name in Azure"
}

variable "location" {
  description = "Resources location in Azure"
}

variable "sku" {
    type        = string
    description = "Choose Basic, Standard or Premium"
}