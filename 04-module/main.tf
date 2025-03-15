module "null_resource" {
  source = "./null-resource-module"
}

module "resource_count" {
  source = "./resource-count-module"
  input = module.null_resource.resource
}