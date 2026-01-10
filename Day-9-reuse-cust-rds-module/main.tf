module "rds" {
  source = "../Day-9-cust-rds-modules"

  vpc_cidr = "10.0.0.0/16"
  vpc_name = "cust-vpc1"

 subnet_a_cidr = "10.0.0.0/24"
 subnet_a_name = "pvt-1"
 az_a = "ap-south-1a"

 subnet_b_cidr = "10.0.1.0/24"
 subnet_b_name = "pvt-2"
 az_b = "ap-south-1b"

 db_name = "test"
 identifier = "rds-test"

username = "gani"
allocated_storage = "21"

instance_class = "db.t4g.micro"

db_subnet_group_name = "cust-subnet-group"
}