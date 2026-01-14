resource "aws_instance" "name" {
  ami = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro" 

  for_each = toset(var.env)   #for_each is key-based and more stable.
  
tags = {
    Name = each.value
}
}