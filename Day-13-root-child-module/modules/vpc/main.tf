resource "aws_vpc" "name" {
  cidr_block = var.cidr_block

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.name.id
  cidr_block = var.subnet_1_cidr
  availability_zone = var.az_1a
}

resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.name.id
  cidr_block = var.subnet_2_cidr
  availability_zone = var.az_1b
}


output "subnet_1_id" {
  value = "${aws_subnet.subnet_1.id}"

}

output "subnet_2_id" {
  value = "${aws_subnet.subnet_2.id}"

}