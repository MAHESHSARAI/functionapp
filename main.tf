# main.tf

terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

module "function_apps" {
  source = "./modules/function_apps"
  resource_group_name    = var.resource_group_name
  location_westeurope    = var.location_westeurope
  location_northeurope   = var.location_northeurope
  runtime                = var.runtime
  app_service_plan_tier  = var.app_service_plan_tier
  app_service_plan_size  = var.app_service_plan_size
  storage_account_tier   = var.storage_account_tier 
}

module "application_insights" {
  source = "./modules/application_insights"
  resource_group_name = var.resource_group_name
  location_westeurope = var.location_westeurope
  location_northeurope = var.location_northeurope
}
