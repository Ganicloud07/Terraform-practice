resource "aws_instance" "gani" {
    ami = "ami-00ca570c1b6d79f36"
   instance_type = "t3.micro"

   tags = {
    Name = "test"
   }
}

resource "aws_s3_bucket" "name" {
    bucket = "gani-07"
  
  #explicity mention create first instance then create s3.
  depends_on = [  
    aws_instance.gani
 
 ]

}