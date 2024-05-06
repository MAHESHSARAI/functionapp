# variables.tf

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  default     = "azure-rg-1"
}

variable "location_westeurope" {
  description = "Location for resources in West Europe"
  default     = "West Europe"
}

variable "location_northeurope" {
  description = "Location for resources in North Europe"
  default     = "North Europe"
}

variable "runtime" {
  description = "Runtime stack for Azure Function Apps"
  default     = "powershell"
}

variable "app_service_plan_tier" {
  description = "Tier for the App Service Plan"
  default     = "F1"  # Free tier
}

variable "app_service_plan_size" {
  description = "Size for the App Service Plan"
  default     = "F1"  # Free tier
}

variable "storage_account_tier" {
  description = "Tier for the Storage Account"
  default     = "Standard"  # Standard Locally Redundant Storage
}
