#RDS instance creation

resource "aws_db_instance" "ganidb" {
  db_name = "gani_db"
  engine = "MySQL"
  engine_version = "8.0.43"
  identifier = "rds-test"
  username = "admin"
  password = "9554017568"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  publicly_accessible = false
skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.gani_db_subnet_group.name


  depends_on = [ aws_db_subnet_group.gani_db_subnet_group ]
  
}

resource "aws_vpc" "gani_vpc" {
    cidr_block = "10.0.0.0/16"
     
     tags = {
       Name = "Cust-VPC"
     }
  
}

resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.gani_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-west-2a"

#explicity mention
  depends_on = [ 
    aws_vpc.gani_vpc
   ]

  tags = {
    Name = "pvt-subnet"

  }
}
  
  resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.gani_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"

#explicity mention
  depends_on = [ 
    aws_vpc.gani_vpc
   ]

  tags = {
    Name = "pvt-subnet"
  }


}

resource "aws_db_subnet_group" "gani_db_subnet_group" {
    name = "gani-db-subnet-group"
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
       Name = "subnet-grp"
     }

  }
