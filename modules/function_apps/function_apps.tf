# ./modules/function_apps/function_apps.tf

variable "resource_group_name" {}
variable "location_westeurope" {}
variable "location_northeurope" {}
variable "runtime" {}
variable "app_service_plan_tier" {}
variable "app_service_plan_size" {}
variable "storage_account_tier" {}

data "azurerm_app_service_plan" "plan_westeurope" {
  name                = "app-service-plan-westeurope"
  resource_group_name = var.resource_group_name
}

resource "azurerm_app_service_plan" "plan_westeurope" {
  count               = length(data.azurerm_app_service_plan.plan_westeurope.id) > 0 ? 0 : 1
  name                = "app-service-plan-westeurope"
  location            = var.location_westeurope
  resource_group_name = var.resource_group_name

  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

data "azurerm_app_service_plan" "plan_northeurope" {
  name                = "app-service-plan-northeurope"
  resource_group_name = var.resource_group_name
}

resource "azurerm_app_service_plan" "plan_northeurope" {
  count               = length(data.azurerm_app_service_plan.plan_northeurope.id) > 0 ? 0 : 1
  name                = "app-service-plan-northeurope"
  location            = var.location_northeurope
  resource_group_name = var.resource_group_name

  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

data "azurerm_storage_account" "storage_westeurope" {
  name                = "storageaccountwebighand"
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account" "storage_westeurope" {
  count               = length(data.azurerm_storage_account.storage_westeurope.id) > 0 ? 0 : 1
  name                     = "storageaccountwebighand"
  resource_group_name      = var.resource_group_name
  location                 = var.location_westeurope
  account_tier             = var.storage_account_tier
  account_replication_type = "LRS"
}

data "azurerm_storage_account" "storage_northeurope" {
  name                = "storageaccountnebighand"
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account" "storage_northeurope" {
  count               = length(data.azurerm_storage_account.storage_northeurope.id) > 0 ? 0 : 1
  name                     = "storageaccountnebighand"
  resource_group_name      = var.resource_group_name
  location                 = var.location_northeurope
  account_tier             = var.storage_account_tier
  account_replication_type = "LRS"
}
