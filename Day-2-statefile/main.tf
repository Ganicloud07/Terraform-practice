resource "aws_instance" "name" {
    ami = "ami-00ca570c1b6d79f36"
   instance_type = "t3.micro"


 /*tags = {
    Name = "Gani"
   }

 iam_instance_profile = "ec2-tf"

 forces replacement means terminated the exiting server and create top of up new server with give subnet 
 subnet_id = "subnet-04078fcf547b562ca"
*/
  }