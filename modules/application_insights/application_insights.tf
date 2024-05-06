# ./modules/application_insights/application_insights.tf

variable "resource_group_name" {}
variable "location_westeurope" {}
variable "location_northeurope" {}

data "azurerm_application_insights" "app_insights_employees" {
  name                = "app-insights-employees-06-05-24"
  resource_group_name = var.resource_group_name
}

resource "azurerm_application_insights" "app_insights_employees" {
  count               = length(data.azurerm_application_insights.app_insights_employees.id) > 0 ? 0 : 1
  name                = "app-insights-employees-06-05-24"
  location            = var.location_westeurope
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

data "azurerm_application_insights" "app_insights_projects" {
  name                = "app-insights-employees-06-05-24"
  resource_group_name = var.resource_group_name
}

resource "azurerm_application_insights" "app_insights_projects" {
  count               = length(data.azurerm_application_insights.app_insights_projects.id) > 0 ? 0 : 1
  name                = "app-insights-projects-06-05-24"
  location            = var.location_northeurope
  resource_group_name = var.resource_group_name
  application_type    = "web"
}
