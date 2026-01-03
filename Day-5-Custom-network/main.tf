#Creation of VPC
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    
   
tags = {
  Name = "cust-vpc"
}
  
}

#creation of public subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-west-2a"
  
  tags = {
    Name = "public_subnet"
  }
}

#creation of private subnet
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-2b"

    tags = {
      Name = "private subnet"
    }
  
}

#creation of IG
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.name.id

tags ={
    Name = "cust_ig"
}
  
}

#creation of public RT
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.name.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "RT"
  }

}

#public rt subnet assco
  
  resource "aws_route_table_association" "public_assoc" {
    subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id

    
  }

#creation elastic ip
  resource "aws_eip" "nat_eip" {
    domain = "vpc"

  }

  #creation of nat_gateway 
  resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public.id

    tags = {
        Name = "Nat_gateway"
    }
  
}

#creation private Rt
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.name.id
     route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
     }

    tags = {
      Name = "private RT"
    }
  
}

#private rt subnet assco
  
  resource "aws_route_table_association" "private_assco" {
    subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id


  }

#creation of security group
resource "aws_security_group" "name" {
    name = "allow"
    vpc_id = aws_vpc.name.id

    tags = {
      Name = "cust_sg"
    }

    ingress{
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

   ingress{
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"  #indicate all protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "name" {
    ami = "ami-0ebf411a80b6b22cb"
    instance_type = "t3.micro"

    tags = {
      Name = "cust_server"
    }
  
}

