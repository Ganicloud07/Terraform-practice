module "test" {
   source = "../Day-8-modules"
   ami_id= "ami-00ca570c1b6d79f36"
   type= "t3.micro"
   instance_name = "test"
}
