terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.39.0"
    }
  }
}

provider "azurerm" {
  features {}
}
 locals  {
  rg = values(azurerm_resource_group.infra)[*].name
 }
resource "azurerm_resource_group" "infra" {
  for_each = var.env
  name     = "tfs-rg-${each.key}-${var.region}-${each.key}"
  location = var.location
  tags     = var.tags
}

output "rg" {
  value = local.rg.0
}

output "rgrp" {
  value = local.rg.1
}

