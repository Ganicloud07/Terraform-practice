module "ec2" {
  source = "./modules/ec2"
  ami = "ami-0ced6a024bb18ff2e"
  instance_type = "t3.micro"
 subnet_id = module.vpc.subnet_1_id

}


module "s3" {
  source = "./modules/s3"
  bucket = "gani-07"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  subnet_1_cidr = "10.0.0.0/24"
  subnet_2_cidr = "10.0.1.0/24"
  az_1a = "ap-south-1a"
  az_1b = "ap-south-1b"

}

module "rds" {
  source = "./modules/rds"
  subnet_1_id = module.vpc.subnet_1_id
  subnet_2_id = module.vpc.subnet_2_id
  instance_class = "db.t4g.micro"
  db_name = "rds-server"
  db_user = "admin"
  db_password = "admin@123"
}