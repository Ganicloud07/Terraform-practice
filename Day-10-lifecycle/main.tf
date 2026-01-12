resource "aws_instance" "name" {
  ami = "ami-0ced6a024bb18ff2e"
  instance_type = "t2.small"

  tags = {
    Name = "cust-ec2"
  }
 /*lifecycle {
    prevent_destroy = true
  }*/

lifecycle {
 #ignore_changes = [ tags ]
 #ignore_changes = [ instance_type ]
}

lifecycle {
  create_before_destroy = true
}

}