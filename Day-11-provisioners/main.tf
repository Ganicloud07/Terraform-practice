resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc-1"
  }
}


variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}


resource "aws_subnet" "public" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${count.index}"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}


resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}




resource "aws_key_pair" "mykey" {
  key_name   = "my-key"
  public_key = file("my-key.pub")
}


resource "aws_instance" "web" {
  ami                         = "ami-0d473344347276854"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.mykey.key_name

  tags = {
    Name = "web-server"
  }


provisioner "remote-exec" {
  inline = [
    "sudo yum update -y",
    "sudo amazon-linux-extras install nginx1 -y",
    "sudo systemctl enable nginx",
    "sudo systemctl start nginx"
  ]
}


connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("my-key")
  host        = self.public_ip
}

}