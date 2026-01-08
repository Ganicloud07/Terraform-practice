module "prod" {
    source = "../Day-8-modules"
    ami_id = var.ami_id
    type = var.instance_type
    instance_name = var.instance_name
  
}