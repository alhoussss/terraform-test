terraform {
  required_version = ">= 1.5.0"
}

module "infrastructure" {
  source = "./module"
  
  instances = var.instances
  name      = var.name
}