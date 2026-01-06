#RDS instance creation

resource "aws_db_instance" "ganidb" {
  db_name = var.db_name
  engine = "mysql"
  engine_version = "8.0.43"
  identifier = var.identifier
  username = var.username
  manage_master_user_password = true
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  publicly_accessible = false
skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.gani_db_subnet_group.name


  depends_on = [ aws_db_subnet_group.gani_db_subnet_group ]
  
}

resource "aws_vpc" "gani_vpc" {
    cidr_block = var.vpc_cidr
     
     tags = {
       Name = "Cust-VPC"
     }
  
}

resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.gani_vpc.id
  cidr_block = var.subnet_a_cidr
  availability_zone = var.az_a

tags = {
    Name = var.subnet_a_name

  }
#explicity mention
  depends_on = [aws_vpc.gani_vpc]

  
}
  
  resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.gani_vpc.id
  cidr_block = var.subnet_b_cidr
  availability_zone = var.az_b

 tags = {
    Name = var.subnet_b_name
  }

#explicity mention
  depends_on = [ aws_vpc.gani_vpc]

}

resource "aws_db_subnet_group" "gani_db_subnet_group" {
    name = var.db_subnet_group_name
    description = "DB subnet group for RDS"

subnet_ids = [
               aws_subnet.private_a.id,
               aws_subnet.private_b.id
            ]

            depends_on = [  
                aws_subnet.private_a,
                aws_subnet.private_b
            ]

     tags = {
       Name = "subnet-group"
     }

  }
