
provider "azurerm" {
  version = "=1.43.0"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraformactionsdemo"
    storage_account_name = "actionsdemo28287"
    container_name       = "terraformactionsdemo"
    key                  = "mFL1+qCbPMNyNmMbhHQPqnsxx3CBYBJ1shjbobWAQZtfmV0wqKW4J2ntodRImz08uVPgSv34kq3+tbvHI5MHFA=="
  }
}

resource "azurerm_resource_group" "rsg_app_plan" {
  name     = "tf-actions-demo-21220-2"
  location = "eastus"
}

resource "azurerm_app_service_plan" "app_plan_test" {
  name                = "hashigithub1231231"
  location            = "${azurerm_resource_group.rsg_app_plan.location}"
  resource_group_name = "${azurerm_resource_group.rsg_app_plan.name}"
  kind = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "hashigithub123123123"
  location            = "${azurerm_resource_group.rsg_app_plan.location}"
  resource_group_name = "${azurerm_resource_group.rsg_app_plan.name}"
  app_service_plan_id = "${azurerm_app_service_plan.app_plan_test.id}"
}

