/*resource "aws_instance" "name" {
  ami = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro"
count = 3                      #count is index-based.

 # tags = {
   # Name = "Gani-&{count.index}"
 # }
 tags = {
    Name = "Gani"
}
}
*/

resource "aws_instance" "name" {
  ami = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro" 

  count = length(var.env) 

tags = {
    Name = var.env[count.index]
}
}