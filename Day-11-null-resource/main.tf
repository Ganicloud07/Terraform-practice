# resource "null_resource" "local_test" {
#   provisioner "local-exec" {
#     command = "echo Hello Gani"
#   }
# }

resource "aws_instance" "ec2" {
    ami = "ami-0ced6a024bb18ff2e"
    instance_type = "t3.micro"
      
    }
      
   
  resource "null_resource" "after_ec2" {

    depends_on = [ aws_instance.ec2 ]
    
    provisioner "local-exec" {
        command = "echo hello tauseef gani how are you "
      
    }
  }


