resource "aws_vpc" "cust_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
      Name = var.vpc_name
    }
  
}

resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.subnet_a_cidr
  availability_zone = var.az_a

   tags = {
     Name = var.subnet_a_name
   }
   depends_on = [ aws_vpc.cust_vpc ]
}

resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.subnet_b_cidr
  availability_zone = var.az_b

  tags = {
    Name = var.subnet_b_name
  }
  depends_on = [ aws_subnet.private_a ]
}

resource "aws_db_subnet_group" "name" {
    name = var.db_subnet_group_name

    subnet_ids = [aws_subnet.private_a.id ,
                 aws_subnet.private_b.id  
    ]

    depends_on = [ aws_subnet.private_a,
                   aws_subnet.private_b ]
}


resource "aws_db_instance" "name" {
    db_name = var.db_name
    instance_class = var.instance_class
  identifier = var.identifier
  engine = "mysql"
  engine_version = "8.0.43"
  username = var.username
  password = var.password
  allocated_storage = var.allocated_storage
  publicly_accessible = false
  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.name.name
  depends_on = [ aws_db_subnet_group.name ]
}
