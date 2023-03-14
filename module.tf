module "rg" {
  source    = "../test"
  location  = var.location
  tags      = var.tags
  region    = var.region
  env       = var.env
  component = var.component
}

output "rg" {
  value = module.rg.rg
}

output "rgrp" {
  value = module.rg.rgrp
}